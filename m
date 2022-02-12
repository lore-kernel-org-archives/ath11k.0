Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B91EC433EF
	for <ath11k@archiver.kernel.org>; Sat, 12 Feb 2022 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pRymIbC96E2YMLAgeNKBHyAwgoQzpbA+9fj3FTHPIU8=; b=UuAtFAukP2aaRi
	ccgCikeUc6jnRaA2z3vXHjH02R33exbAEJlV5j5b3XznHsn9fphRNDPjmC4lAp7vlQFHl02P/qKCR
	SHtZaGLeQ0P7T5y/yjaRQSQZgyYVTZjFU9OOHsJXnp7pIrpk235YiW6/LK37/v4fq2FlcUTlPZ+4i
	bM11ldBmPGL7zoa2YXGznX+O1bFGbCgr4kFAKLKFQsBTtPewR3q/zV1jWmk/Da9Q5naWFy6GyI7mk
	6orhwc6QBZBLURJ1UFEolFQJ1agitbTAMdyjfekOlJKLezUoHO5nHmudbBGHZN5GaHsKefb13Ingr
	29demR7GuDy+3VGfHsGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIzem-00AYys-4j; Sat, 12 Feb 2022 21:10:12 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIzej-00AYyV-9r
 for ath11k@lists.infradead.org; Sat, 12 Feb 2022 21:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=PBtf4rPsa5e+Qn5Lx97LOIpX0MjdfeHnl6+s5vBIPaM=; 
 t=1644700208; x=1645909808; b=rxH6qBbbEZ1nkYbEzJUSTZsNN85/zjq/x2xYmblY4sL+mQs
 d9AYMwtSaYwRF+aIH9/6flSwdhuAKZABYnrQhFkeWzuDZhrcCJDjw7D6R0cngFMdKxGfXlgtB64sf
 QRtQujWpM4RkLTxGTA9Ue0BpuZI8g2VkqNFnxhtLmc6HStPPjb3++k5eHLB+YvaleyP0HsHnvjETS
 XlnvPktGpuDf/f4RUE9auxfaK11IdTAsVGAUoNfRRvQAx6tUTfOKDFTmklxBjGcEaEcvMGCaLGg2a
 0Klyo8LBX9onAs5h1dM/5XzmRN0k4NX//bYuZWbUSwr3lYi+KfypgVcHcmET8dfg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nIzeh-000Mmp-3n; Sat, 12 Feb 2022 22:10:07 +0100
Message-ID: <6d87acca10648841b60e2a28a46a328340bf939a.camel@sipsolutions.net>
Subject: Re: [PATCH 1/6] nl80211: vendor-cmd: qca: add command for CFR
 configuration
From: Johannes Berg <johannes@sipsolutions.net>
To: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>, 
 ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Sat, 12 Feb 2022 22:10:06 +0100
In-Reply-To: <1644592075-27082-2-git-send-email-quic_vnaralas@quicinc.com>
References: <1644592075-27082-1-git-send-email-quic_vnaralas@quicinc.com>
 <1644592075-27082-2-git-send-email-quic_vnaralas@quicinc.com>
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_131009_376667_70BF01C9 
X-CRM114-Status: UNSURE (   5.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Fri, 2022-02-11 at 20:37 +0530, Venkateswara Naralasetty wrote:
> This patch is to add vendor command support to configure per
> peer CFR parameters.
> 

That's pretty much the worst way to start this ...

Please explain at least what CFR is? What does the feature do?

And please also see
https://wireless.wiki.kernel.org/en/developers/documentation/nl80211#vendor-specific_api

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
