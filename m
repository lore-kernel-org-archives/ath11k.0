Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C79CFA466
	for <ath11k@archiver.kernel.org>; Mon, 24 Nov 2025 15:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j08fRzLQoLt6C5VDLeQqvETKwCBJOljYGKspqKfWPzs=; b=sBbHs2ea/UW6cJRSdjEXnPyKnc
	atoy2MC0ogYMVsdPhHo8mX9kxNgDKzSp8b+P/p+HU+Ad5Pv8d8zv7CfBpKxXi2Quf1aknpMEVvYIy
	6ycbXzsYdPmm/sIw66m2UGuYL9qf+IwvUCGlYM47ovM+aJ+JUED7wRhBu0aQYxDF5tLLm85qI50eM
	7TmbrieCMmLln0GIjhp7lx1WjTH4j8dQyfaVnq9k4L7SQ40NI5F97Bcha75HdE5bXZl4eD2KqZ/q/
	ovY5L/CImnGxg01pl7YBOUzkvNuVsUsy0fpxNVlhB5zGhNsxU//+l3p9YPFy/msKmucOApFqPzx0I
	d8B7YBdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYIM-0000000BtnW-1QOb;
	Mon, 24 Nov 2025 15:16:02 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYIJ-0000000Btmz-43vZ
	for ath11k@lists.infradead.org;
	Mon, 24 Nov 2025 15:16:01 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 50BEC1D0015D;
	Mon, 24 Nov 2025 10:15:56 -0500 (EST)
Received: from phl-imap-09 ([10.202.2.99])
  by phl-compute-02.internal (MEProxy); Mon, 24 Nov 2025 10:15:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1763997356;
	 x=1764083756; bh=j08fRzLQoLt6C5VDLeQqvETKwCBJOljYGKspqKfWPzs=; b=
	KB+TsKrvo35ClEj14DfQWgVUEGBDnkjQxRyfcckZHQjuSACClQTK73HtRKwr5U89
	XTn4M9JfCiBLy8msl4b0B0Tf4fOH9pBs93Q28EV86smU7Q31TT06u6NNuQCaaPU4
	GkvTl28zJui1zGFBOpa+OXEvpix3NOZpuuukIpN/TSCHO4UcdNEQkGMF8Nk4MKlM
	JtpmmKFrX+DaCV7kTunDGuXSKorMiKTnybrDoInKbHXd0oWrAYz843jF7FwfMFxG
	eJAQWFR56UGIWe4UoEIBu4GPmhdz8116dI+MgYudPt/+RTHnlN5K6BJIcGv7QQVw
	a/xprRxf4qeFsT7hY+dI4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763997356; x=
	1764083756; bh=j08fRzLQoLt6C5VDLeQqvETKwCBJOljYGKspqKfWPzs=; b=d
	Vn5NmIOcaCeATv8CmjaxlJtbtWbQQzSRBVqufFRESjqJUmtHPccEKDY7WNydcPYw
	ZOLDF8HDZyVlKMFRRLYFu/OQEijPIhKDrgi2/CWab2KbN/aJXAtfqxeq11elS0Uc
	p3j3cVcRfvVwydcySwpkZ9W+BZPlHBoVC5ZtdmDb7IbrcOU5Y7gQ+Rqud0Hy0Znp
	jVh6K65IdbMMJx3bZ8fjHHbjB6GO90Cj3GGanZ7QM1gaLR/67YGXu9T4YZ7cCHlm
	FvhBXrXsQXLgRUYaBCiQ00jLztsDJeHi5pCbXnqLhEXjPbSgTLEeIKVuh6lfqU/D
	VCeuro+yXqsLp9Yu8Vreg==
X-ME-Sender: <xms:q3YkaWfE79aKaN93ZlyYq4-WI73t58GwcUdfJsQ4b7E02EQoAcLZtw>
    <xme:q3YkabD9DSs1qsbwBbguzTmzVz1ACxXk9aON7NCeQtZ_n21wD5QGEfZR3xeB7ijZq
    UyJATrODW3xRTJD2804A5YHPDBCEe6C-Sm-IDjc0xL23SzqBm7cbR0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfeekleegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpefhhfffleeugeeivdelhfdvteejudekheetfffgueff
    leekudefteehieffuedtteenucffohhmrghinhepshhushgvrdgtohhmnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhl
    vghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheprghthhduudhksehlihhsthhsrdhinhhfrhgruggvrggu
    rdhorhhgpdhrtghpthhtohepjhgvfhhfrdhjohhhnhhsohhnsehoshhsrdhquhgrlhgtoh
    hmmhdrtghomhdprhgtphhtthhopehtihifrghisehsuhhsvgdruggvpdhrtghpthhtohep
    lhhinhhugidqfihirhgvlhgvshhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:q3YkaYIezSIMr2Y04aVgG9u_n6ZBXj_4ninn3Ub8-3SOyFnFN5p3Pg>
    <xmx:q3YkafCvwxFsqnfhoWupcmj3qwQlnG557p7ITF1krNW_Zm6z_fa6Vw>
    <xmx:q3YkaRActlTFRq6TIX5n58jvcGRMvVp2g4i0Bo2rrAN3Mkq0mDE4Bw>
    <xmx:q3YkaRB9IfPLbOS-SBgfpBb6Ty5q_3aWfd-1srmORO-e9qbUW9dtKA>
    <xmx:rHYkac0noh2rD_NofxsUDfa9-C-b2DcYo-NMOUc4O4zmDVGrvsvfQGfX>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B25443020081; Mon, 24 Nov 2025 10:15:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Aw6v1Pokv1cZ
Date: Mon, 24 Nov 2025 10:13:05 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Takashi Iwai" <tiwai@suse.de>,
 "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Message-Id: <cb594fb5-faa3-4c6a-8ece-d2e176e196df@app.fastmail.com>
In-Reply-To: <20251124134713.5819-1-tiwai@suse.de>
References: <20251124134713.5819-1-tiwai@suse.de>
Subject: Re: [PATCH] wifi: ath11k: Add quirk entry for Thinkpad T14s Gen3 AMD
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_071600_368547_8BA3F717 
X-CRM114-Status: GOOD (  25.13  )
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

Thanks Takashi-san,

On Mon, Nov 24, 2025, at 8:47 AM, Takashi Iwai wrote:
> The recent kernels showed a regression wrt suspend/resume on Lenovo
> Thinkpad T14s Gen 3 AMD model; it fails to reconnect on resume after a
> long time sleep.  The only workaround was to unload/reload the driver
> (or reboot).
>
> It seems that this model also requires the similar quirk with
> ATH11K_PM_WOW which has been done for other Thinkpad models.
>
> Link: https://bugzilla.suse.com/show_bug.cgi?id=1254181
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>
> I'm not sure whether this model has another DMI entry, so put Mark to
> Cc.
>
> Also, I wonder which Thinkpad models are rather the ones that should
> *not* take the quirk.  Since mine is Gen 3 and I already see Gen 2
> entries, which else remaining...?
>

It should only apply to models with the ath11k modem - but it looks like Gen 2 up to Gen 6....which is quite a lot. I don't know if all of those are impacted.
I think we'll have to do more testing and get feedback from the FW team, which will take a bit I'm afraid. I'll look into it.

>
>  drivers/net/wireless/ath/ath11k/core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.c 
> b/drivers/net/wireless/ath/ath11k/core.c
> index 812686173ac8..3aa78a39394b 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -924,6 +924,13 @@ static const struct dmi_system_id 
> ath11k_pm_quirk_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "21J4"),
>  		},
>  	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* T14s G3 AMD */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21CR"),
> +		},
> +	},
>  	{
>  		.driver_data = (void *)ATH11K_PM_WOW,
>  		.matches = { /* T14 G4 AMD #1 */
> -- 
> 2.52.0

I think you need to add the "21CQ" Product Name for this platform too (every model has two IDs depending on where in the world it is deployed)

Unfortunately my T14s G3 AMD seems to be dead :( I can't test and confirm directly.

Thanks
Mark

