Return-Path: <SRS0=zO0o=OT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B76C433F5
	for <ath11k@archiver.kernel.org>; Wed, 29 Sep 2021 03:21:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EE3060EBD
	for <ath11k@archiver.kernel.org>; Wed, 29 Sep 2021 03:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0EE3060EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCLLJbe5SX+TDCZJ7vPI4Gn+ZeN2gxu/XrvVRErEUNE=; b=m5+m4Yy3nsP8E8qWJ3BNOePNM5
	5zX6Dpu74FxBWsU156fyXUcH1I7QCrstfQyjEmyZKpQd6SzPwgdKEa2cPxGUzfsYiI5wVtrYv9LLj
	PkjKCXP/QS0uMe5Sy32jlRjHNXyPEOmglnqrwe5jyUc5Qi25T83ze9LsC81OvT/vBwl376OaoXLLu
	/jCUWqwhy7pHKkhbtmmGwPb5mqCaZwslVq8l8BreAwSJeJ4t5Ab0B5C3dlugEKrrvOzlvyOfr8AdS
	kpVtCsb2P8CqClxw9O7QDtbwWfj6OCaZuFTI2lUvmVjf3RfXP0wvSP4O1sgaUM9PMlQQsqZ614pKU
	J5mFgSLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVQ9l-009mpz-ES; Wed, 29 Sep 2021 03:21:17 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVQ8c-009mFr-5B
 for ath11k@lists.infradead.org; Wed, 29 Sep 2021 03:20:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632885608; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=sY7hQoJt2ylgvIk5pkR7uTnciIBjd6B0lWCPJ68j/GE=;
 b=SRA6jHtOopnwrR2ELTha+NyDmkpJjOtpXkbBw8Xf96VbpdjfYpHem7/i2tG7fBu8F9zZf/sz
 +qJQGBFPx94Y9efPtPVDPieujj/v7gU8Cxc8/StYC6PCa0NC3Jz7vKgWL8BqVUhzBwCmVLZF
 HNKdSPnyxKWn6UIc0mnAb9wKFrw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6153db629ffb413149a20a03 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 29 Sep 2021 03:20:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 818AAC4361A; Wed, 29 Sep 2021 03:20:01 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 182C6C43460;
 Wed, 29 Sep 2021 03:20:01 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 29 Sep 2021 11:20:01 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v3 2/2] mac80211: do intersection with he mcs and nss set
 of peer and own
In-Reply-To: <b6c96c4ecdf9ec175d7f89e8600fb53768287cc2.camel@sipsolutions.net>
References: <1609816120-9411-1-git-send-email-wgong@codeaurora.org>
 <1609816120-9411-3-git-send-email-wgong@codeaurora.org>
 (sfid-20210105_041051_256789_4F276B28)
 <b6c96c4ecdf9ec175d7f89e8600fb53768287cc2.camel@sipsolutions.net>
Message-ID: <facd18458a7ecfc0afbfd06c8a57d849@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_202008_225812_42AFC083 
X-CRM114-Status: GOOD (  13.45  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-09-28 21:02, Johannes Berg wrote:
> Hi,
> 
> 
> I had done a bunch of fixups to this patch, but the zero-day build 
> robot
> correctly reports that:
> 
>> +	ieee80211_he_mcs_intersection(&own_he_cap.he_mcs_nss_supp.rx_mcs_80,
>> +				      &he_cap->he_mcs_nss_supp.rx_mcs_80,
>> +				      &own_he_cap.he_mcs_nss_supp.tx_mcs_80,
>> +				      &he_cap->he_mcs_nss_supp.tx_mcs_80);
> 
> the &own_he_cap... parts here will take an __le16 pointer to a possibly
> unaligned variable - any thoughts how we could fix that?
> 
Hi Johannes,

Add "__packed" before the "__le16 *" should solve this warning by my 
understand like this:

diff --git a/net/mac80211/he.c b/net/mac80211/he.c
index c05af7018f79..960fea9646b0 100644
--- a/net/mac80211/he.c
+++ b/net/mac80211/he.c
@@ -52,7 +52,7 @@ ieee80211_update_from_he_6ghz_capa(const struct 
ieee80211_he_6ghz_capa *he_6ghz_
         sta->sta.he_6ghz_capa = *he_6ghz_capa;
  }

-static void ieee80211_he_mcs_disable(__le16 *he_mcs)
+static void ieee80211_he_mcs_disable(__packed __le16 *he_mcs)
  {
         u32 i;

@@ -60,8 +60,8 @@ static void ieee80211_he_mcs_disable(__le16 *he_mcs)
                 *he_mcs |= cpu_to_le16(IEEE80211_HE_MCS_NOT_SUPPORTED << 
i * 2);
  }

-static void ieee80211_he_mcs_intersection(__le16 *he_own_rx, __le16 
*he_peer_rx,
-                                         __le16 *he_own_tx, __le16 
*he_peer_tx)
+static void ieee80211_he_mcs_intersection(__packed __le16 *he_own_rx, 
__packed __le16 *he_peer_rx,
+                                         __packed __le16 *he_own_tx, 
__packed __le16 *he_peer_tx)
  {
         u32 i;
         u16 own_rx, own_tx, peer_rx, peer_tx;



net/mac80211/he.c:158:33: warning: taking address of packed member 
'rx_mcs_80' of class or structure 'ieee80211_he_mcs_nss_supp' may result 
in an unaligned pointer value [-Waddress-of-packed-member]

> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
