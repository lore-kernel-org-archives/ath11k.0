Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFEC2C433EF
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 14:01:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1ED66108F
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 14:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1ED66108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kb0+SorpJkypB448w83HYivbxsUyIfxmPfHiFTKrABs=; b=J1/57n4YqJXXkO
	TnLfSeQNhmCiQ30Y2XOzl0XO20bd5GIhGTNvuqvOfFue0aMhOiFdw5HjYVPoieTOuA+PYYY5KjEuh
	evBV2UI/L97l24Wp5QYaQPux9KOol7C2dtOjSH2xYvbD0AtPsg05DdU6GER35rBvMv9MToWsJc+lZ
	PQD87Nc6EZE8dJmWC/szdCnoUBXULFkuI0sVywVcqo7VtMzoKt+Isl0nQnox7yk6K+q7+yt/YcTD0
	cdC7tbS37Hfwrya/8o/aegwqteJx1v5CBO7HAt6c0q5EKt1DHGyJM5NFIxlbY72jHMY0KDM8e6+cF
	EgUIDGrgpwAHgCHt4yGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVDft-007TWK-QT; Tue, 28 Sep 2021 14:01:37 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVDff-007TU3-D0
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 14:01:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632837695; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=rGRqMiSr+utsu0N2GnIEhsd+ua7sY04vP9Z7vhIgCRs=;
 b=KTKhKuA0prc1NkOWTX1y1/K8GFwBEdAFXPlutBodhPa/Qfuk6tPMqW/YUVgsDrFWFRkunZO0
 Xfny8xmfcm6uPZUGBuyQ4jaMN41JOgYNEWgqtxq9xDErLZjxFzFCFx01EYAjI9W3K6EMTG/A
 m/kyf6knjqvgLZ4yCmDMpydTuhw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61531feda5a9bab6e8efcaab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 14:00:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9BBDAC43460; Tue, 28 Sep 2021 14:00:13 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C8DB9C4338F;
 Tue, 28 Sep 2021 14:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C8DB9C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ieee80211: Add new A-MPDU factor macro for HE 6 GHz
 peer caps
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210913175510.193005-1-jouni@codeaurora.org>
References: <20210913175510.193005-1-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210928140013.9BBDAC43460@smtp.codeaurora.org>
Date: Tue, 28 Sep 2021 14:00:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_070135_360775_01A94555 
X-CRM114-Status: UNSURE (   7.02  )
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

Jouni Malinen <jouni@codeaurora.org> wrote:

> Add IEEE80211_HE_6GHZ_MAX_AMPDU_FACTOR as per IEEE Std 802.11ax-2021,
> 9.4.2.263 to use for peer max A-MPDU factor in 6 GHz band.
> 
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Acked-by: Johannes Berg <johannes@sipsolutions.net>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath-next branch of ath.git, thanks.

62b8963cd84d ieee80211: Add new A-MPDU factor macro for HE 6 GHz peer caps
c3a7d7eb4c98 ath11k: add 6 GHz params in peer assoc command
6f4d70308e5e ath11k: support SMPS configuration for 6 GHz

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210913175510.193005-1-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
