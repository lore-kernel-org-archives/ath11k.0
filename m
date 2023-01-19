Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69271C004D4
	for <ath11k@archiver.kernel.org>; Thu, 19 Jan 2023 15:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3o82T9/wvTQokorKMEHEmsaKqq26q676uUtTKhZYl0=; b=fAcZ1U13yRw0Fv
	BwimdxpiCBNKB5ah1kuq4+lnLmIa/RY75nEsz8y06mTXd9+ze7YI+6+J62GaFVpuLcJOOdx/wlz9H
	T9txWEuF0r7/fxxYt6VOXto+7U5bMgfh0hfBms3+2mXA2zD8Ib0BT9K9EsaKtm/d0KsvV2LgIl6vq
	fJnN+teuCvlsJNkTw+z7LpuGGNAw1x0sxQPmHXqMU4TYvbHxjvljoypEefW5D3+wTnijbBDJWUoYT
	AqXJu9cqgHo/mkLmncKsguWKT8Kzqq2zwyRcEw++qkr67GXtecbZb62mhdViqwIlJnf54apx74mw9
	exc5Eok+G9rseaTn4iCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIWR9-005WkO-Kt; Thu, 19 Jan 2023 15:02:43 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIWJS-005TgM-Ty
	for ath11k@lists.infradead.org; Thu, 19 Jan 2023 14:54:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=pbS/bX9VJ8VmQVK8TpueUPlWivBwz9nNw66dd1UfI8s=;
	t=1674140084; x=1675349684; b=LzgpAoCXMyY71zSr7ZumcNXBf2rJYLewosWrKICDKaTum74
	xh4jCP2mProkVy8ADccvaaZCzQ2zKWs4m585twODhyAGKDga6VqwLH8fZ81C/yfbNvACGUAD93QBg
	xyXPlNt6B9DV9ZYpDoH2srWjElshlDYYj0hxZTjCn+D0KKn6YQRblIrAj+wrJJ/ev2C8b/l6Dab31
	EA2KfdYj9xfx8agjKwZz6+r1Re+x4+MX4j8d3+SE5RNf+p2Mowt2xS21MRcr5/LqIXzunSL8Zbq+G
	u2znz5SntjvPI2VV1pzPuvQW+nS59kvxfW00Be58ZH8IBDljns2Clo1CR6BIKQng==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pIWJM-006Y8W-2j;
	Thu, 19 Jan 2023 15:54:40 +0100
Message-ID: <2a2332211b2ca9daa968a3644006f5c9e0c88a00.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] nl80211: add support to enable/disable bss color
 collision detection
From: Johannes Berg <johannes@sipsolutions.net>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>, 
 Rameshkumar Sundaram <quic_ramess@quicinc.com>, ath11k@lists.infradead.org,
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org
Date: Thu, 19 Jan 2023 15:54:39 +0100
In-Reply-To: <1609a645-3e23-7e37-9aa1-94f970e481e2@green-communications.fr>
References: <20221226083328.29051-1-quic_ramess@quicinc.com>
	 <20221226083328.29051-2-quic_ramess@quicinc.com>
	 <74c57dc34af10537f98f5bb9b6ce80e5676e09b0.camel@sipsolutions.net>
	 <1609a645-3e23-7e37-9aa1-94f970e481e2@green-communications.fr>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_065447_012963_7ABAD22D 
X-CRM114-Status: UNSURE (   7.51  )
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

On Thu, 2023-01-19 at 15:52 +0100, Nicolas Cavallari wrote:
> 
> This may not be related, but the software color collision detection 
> sends a netlink message for every colliding frame and it can hose up the 
> system if the other network is very active.
> 
> Also, cfg80211_bss_color_notify() complains that the wdev lock isn't held.

Yay.

Lorenzo can you take a look at that?

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
