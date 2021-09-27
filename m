Return-Path: <SRS0=w2Qz=OR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40C3C433FE
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 11:28:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD80B60F4B
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 11:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD80B60F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JRvs2OOqk5CGRJJ2GczPuLvzKz+VhG5NXm8Q8YAg1X8=; b=sieEawCFyHzPid
	/isizRarfF4T9C0QoUboCuOVF6gMljAf0Nce/TGOMQxE4N8KP2Fl60+5zLScz7n3e0niAV4g/+IR3
	oDcz3g8o48br6jjoyuI2KS//Qfdd18XXhWYSBt65Qd2qcxdhPYcB+M8O9x33pfASb2/6xJahWGVfW
	I2X6uRNYaoYb6o/2Q/FcxTcjCMl2u4z0uyHVnA8ppZjLfygUmYOh9ysdXiDZWN6+ZyMn9+fW6faSZ
	yypprtT1q/2XhVw2bCNpssGqr7qNzmkVtFPZNub0fwrbnbxGcZdJ0K8ekfl3u16194hSvFJbnyanh
	vfiZkb3SbLjPhifsXbEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUonx-002RFJ-1m; Mon, 27 Sep 2021 11:28:17 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUonu-002RF0-8z
 for ath11k@lists.infradead.org; Mon, 27 Sep 2021 11:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=Cmq7PqsgqoI+LbrAJLMGvvIn2XTpbqmWI6SQWZSpIeo=; 
 t=1632742094; x=1633951694; b=HqXrKXe6I9AxQ8ehwx3huYLp1iS1XKt50BhFBK9YxAtqZau
 tEUMnpY9cS3MYObCeAyHa6ESmulBvMdouDMxWZHS6xxiNJkxVYCU9KkAXPKmU+hSw9AIx6WDJHsou
 CN5pzuEsDOB0V/VWzJ6UuAEytj/f7EcGGzNw2PzePq21Ze47FxZK6pPF9Urx91NHr9Z9Di+rRtEcb
 mnIihaJ+Xkg9xHarjZ/SVE3Hd+DjXsQWvFCWJUEHSOsTjOh69BCylKxg3MBuNTVrEy/cl98PVk9dx
 YsFYoN2b1VLRKUg6Q1GJTxs0v7EaV3lsd41EjK/Twe+oQ/7BZceNxbgsXh865BHA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95-RC2) (envelope-from <johannes@sipsolutions.net>)
 id 1mUons-00COfc-VU; Mon, 27 Sep 2021 13:28:13 +0200
Message-ID: <56754afbae715eb64bd82269fa9bd79bdc5f4447.camel@sipsolutions.net>
Subject: Re: [PATCH v4 3/6] cfg80211: add definition for 6 GHz power
 spectral density(psd)
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Mon, 27 Sep 2021 13:28:12 +0200
In-Reply-To: <20210924100052.32029-4-wgong@codeaurora.org>
References: <20210924100052.32029-1-wgong@codeaurora.org>
 <20210924100052.32029-4-wgong@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_042814_335442_2610A7D9 
X-CRM114-Status: UNSURE (   5.45  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyMDIxLTA5LTI0IGF0IDA2OjAwIC0wNDAwLCBXZW4gR29uZyB3cm90ZToKPiAKPiDC
oAlOTDgwMjExX1JSRl9OT184ME1IWgkJPSAxPDwxNSwKPiDCoAlOTDgwMjExX1JSRl9OT18xNjBN
SFoJCT0gMTw8MTYsCj4gwqAJTkw4MDIxMV9SUkZfTk9fSEUJCT0gMTw8MTcsCj4gKwlOTDgwMjEx
X1JSRl9QU0QJCT0gMTw8MTgsCgpJbmRlbnRhdGlvbiBzZWVtcyB0byBiZSBtaXNzaW5nIGEgdGFi
IGhlcmUuCgpqb2hhbm5lcwoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTFrCg==
