Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E72CCA470
	for <ath11k@archiver.kernel.org>; Thu,  2 Oct 2025 00:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7XMYXKoKf0KXuqzI3qHzhDk9NpiNn7xmPgDTKLecJQ=; b=Vp2hD4VmMwWbvFkJ7n7/DGye74
	8hwwl8DEbqL6JGrOP3oR5kdIBuMxEDvKaZPWJGO2cZamb69z5qqFk9yWem4/73op62zCtAj0R+22m
	lBAxyKKzTNXLgx4vqEI18n5IpsiqaYsFBBlCkCROpEEX/nRnHbesITiVBH84CAx/UT/DKCLkdm6hf
	dZPfyKz0LnZ7G0EGJ0xmsOkOkYF8R8TDcJ8gGdH8xKi/oLIfrkCTFR9iJpi3OIa11Jo9EfPMTqFL0
	l5K0RRlSmibOSqs0P75usPk8XhIgU11z9LuGiFI1u39dxCpxEo95gg1fia8zLgwsapKMhAqvaYS87
	QW8Xqcxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47Ks-00000009KEC-2vlx;
	Thu, 02 Oct 2025 00:38:18 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47Kp-00000009KDa-45qC
	for ath11k@lists.infradead.org;
	Thu, 02 Oct 2025 00:38:17 +0000
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5F91814000DA;
	Wed,  1 Oct 2025 20:38:12 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Wed, 01 Oct 2025 20:38:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1759365492;
	 x=1759451892; bh=y7XMYXKoKf0KXuqzI3qHzhDk9NpiNn7xmPgDTKLecJQ=; b=
	Kf+zPFMx3dwFuBg2v1PfSBlg5Q6lEYzOO1Dhoi3YZJinZyXjre2J09QBIgh2zUm6
	HciQFPA9+QOlpkz9gmaE7Avh5O0FSbFG86lOKfSBkYTGszmg+2s5y4YhNCsqop0Q
	QahKHg0DM+0G/N40f6t91EDrM53awDP99znMN8iGNkDwXIYpHSIRkLJO8knz9jo/
	BPM+4dIuwhWt6B70+n3qOIwT1HAsaGzQt8eeEwtoSWIPxaGE6ctcOdKi1jPuYKgA
	OEbMYf1zzzVvNrC5XB3sdruV12HXA48f9FtGq6iPDNwPHVQ1SZHNR/xF6lTDTofA
	zrV3L58X216DnYZRNGaCPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759365492; x=
	1759451892; bh=y7XMYXKoKf0KXuqzI3qHzhDk9NpiNn7xmPgDTKLecJQ=; b=j
	mJBmgC2TiRhcSrvir5NXszPUb8iYy/BK6aItJ+S3Nw5yT/mq207btOXAcMJzCzb6
	qOh1OnymwuK66KaDaMrxkyQ5b846T5Ar+Zoj7uB0aCKUg0+zrJMzscccTuGhapaK
	tG73wAlZSBMWcZpEGfpGuPtSyyJA1V8V4QY1ZkAVhrYIuIY4iQq6ACateNNJQWYq
	iGrCr9Hk4Z5wMX4sPqlAy6J0ILMchyiHr3zMSsfWIngh07FtMuEV1vmporQAMVMo
	bx9ixN9Qd9OpajyROGdIPpjp4KjuygkCLmIBQFSjEIbJ3Z+Am01A7GDg/qSHzPIV
	2wVlDQ2G8bET0rrrl6OEA==
X-ME-Sender: <xms:c8ndaNCyubPts32vktkvpck5YQ8hPq3WnHA08eF-opovGzjXzXKlUA>
    <xme:c8ndaGXWBnB-K2JaJ9czId1wrC74uiusjvU-KM4PRRrIGgbn9bMHqbhCNA_STaWVb
    dJpxw4t5j9HG8af2xClzNwAqcnUxLEz-gYRF1i8nzBVdCY3G-7IWck>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekgeehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnheptdffvefgtefhveetuddvfeelveektdduvdelgfehgfei
    keffjeetjeevffektdfhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdq
    lhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeeipdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehjjhhohhhnshhonheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprghthhduudhksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtg
    hpthhtohepsggrohgthhgvnhdrqhhirghnghesohhsshdrqhhurghltghomhhmrdgtohhm
    pdhrtghpthhtohepjhgvfhhfrdhjohhhnhhsohhnsehoshhsrdhquhgrlhgtohhmmhdrtg
    homhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdifihhrvghlvghsshesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:c8ndaCpxaw5eWMM_lysJuY986eEIzWl1yHJFaM9-n3dAxsNEqTv2Vw>
    <xmx:c8ndaKtKcLyphnS9SoMQ4fKdIbS-bq2ntk5AYS1N0n_FUHr3BadsNA>
    <xmx:c8ndaHHIY7L47Vt1YOwhW8Ntj2Au7rt639GKEfOB_eP6KG2tsAnu_w>
    <xmx:c8ndaDbZJu81EkiBUn3E6WfnU1QKNXrxG49pX9sIEZmwJq66QAEo2Q>
    <xmx:dMndaDm1EK1CDcprAfStrdA57oEFdI0938nour6KERG58Dsz6iFocJME>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A204C2CE007E; Wed,  1 Oct 2025 20:38:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AVTq1tek_bVo
Date: Wed, 01 Oct 2025 20:37:51 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>,
 "Baochen Qiang" <baochen.qiang@oss.qualcomm.com>
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <d7f00754-60fb-4ecb-adaf-a706121e757c@app.fastmail.com>
In-Reply-To: <85b5f6ab-a372-4ccf-b41f-67c1d22df3f0@oss.qualcomm.com>
References: <mpearson-lenovo@squebb.ca>
 <20250929192146.1789648-1-mpearson-lenovo@squebb.ca>
 <83de6105-ef4c-48dc-8960-430893ae253e@oss.qualcomm.com>
 <85b5f6ab-a372-4ccf-b41f-67c1d22df3f0@oss.qualcomm.com>
Subject: Re: [PATCH v2] wifi: ath11k: Add missing platform IDs for quirk table
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_173816_626423_DA1237AE 
X-CRM114-Status: UNSURE (   6.82  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


On Wed, Oct 1, 2025, at 8:11 PM, Jeff Johnson wrote:
> On 9/29/2025 7:17 PM, Baochen Qiang wrote:
>> On 9/30/2025 3:21 AM, Mark Pearson wrote:
> ...>> +		.matches = { /*P16s G2 AMD #1 */
> ...>> +		.matches = { /*P16s G2 AMD #2 */
> ...>> +		.matches = { /*T14s G4 AMD #1 */
> ...>> +		.matches = { /*T14s G4 AMD #2 */
>
> In addition to Baochen's comments, in my pending branch I've also fixed these
> 4 instances of missing space after /*
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=79208b9ac68a7e71ad7e60cc37038c35b2b4252f

Thanks Jeff

Mark

