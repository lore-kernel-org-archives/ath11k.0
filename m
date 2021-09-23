Return-Path: <SRS0=q7Iz=ON=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89F5C433EF
	for <ath11k@archiver.kernel.org>; Thu, 23 Sep 2021 08:25:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93B1A60EE7
	for <ath11k@archiver.kernel.org>; Thu, 23 Sep 2021 08:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93B1A60EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhvrt4bGmqQQ5wSw0xOTAyo9oNsYetF2hTKgxCzRNiY=; b=MLfQMRvbkaYsOIHhkk/uSu3It3
	xky4m05ap9zMqqghl2P3HETeuc1yM+9k9dm+S9TQlel6Vown6PRYH4dv4t9qwKHJF3clqkCBqh79+
	9dxaFiK+nT0vaNmCDFV9NpaynBY7lsUpaMLX8SPI2SsCY1jUJLEbEeSonxbI0NLetCfaZFQYdgI7m
	sxqm/hGjp8577bOwbXOKnE+jmN9+4tmsP3l5J3eltaaiQPY5TSE7ioQlx3ZgKiiU3n2RuEhYguOnm
	jIwtsTR1gRq1ikvlFRgsbx8IA3tkt71b6X09oYX3ahwCVPMImpaOmgIun9yvNSOKLWQa/Qu5B4JHX
	6ihCEfOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTK35-00Adxm-78; Thu, 23 Sep 2021 08:25:43 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTK31-00Adwo-Cn
 for ath11k@lists.infradead.org; Thu, 23 Sep 2021 08:25:41 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632385539; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=gT/VccCp5aw7PRlM1kDBe6XKW/yd73j6PtGHCx+g64E=;
 b=bQsKShzTC228CxO2gOeBF446mkDO8vPs1lgE8XbW5MISOAAAtZF7pqUE/GDGVOi4qrn0frGG
 TJaTHWPNOQnvZx0XuHOBifvfpsJk3dGmonvxm8K4hiqeSCUyPD6PwLcZKWjc5ayi/4z5wzln
 3X8+MgKmmIkT5RdD78J8x4gLjog=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 614c3a02e0f78151d66abdac (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Sep 2021 08:25:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DC2C3C43618; Thu, 23 Sep 2021 08:25:37 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D903C4360D;
 Thu, 23 Sep 2021 08:25:36 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 23 Sep 2021 16:25:36 +0800
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH v3 8/9] mac80211: use ieee802_11_parse_elems() to find ies
 instead of ieee80211_bss_get_ie()
In-Reply-To: <20210903114821.23346-9-wgong@codeaurora.org>
References: <20210903114821.23346-1-wgong@codeaurora.org>
 <20210903114821.23346-9-wgong@codeaurora.org>
Message-ID: <3ed7ae36af1e753e1b072a845b8f2dc2@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_012539_556976_CA85C646 
X-CRM114-Status: GOOD (  23.10  )
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

Hi Johannes,

This patch need a new version for fix the issue of NULL pointer it 
exist.
You can review others:)

The change I will add in new version is like below.

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 0ebf6ae6dd525f..bee2a3f3bbc161 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -5026,11 +5026,15 @@ static int ieee80211_prep_channel(struct 
ieee80211_sub_if_data *sdata,
         if (!(ifmgd->flags & IEEE80211_STA_DISABLE_HT) && !is_6ghz) {
                 const u8 *ht_oper_ie, *ht_cap_ie;

-               ht_oper_ie = ((const u8 *)elems->ht_operation) - 2;
+               ht_oper_ie = elems->ht_operation ?
+                       ((const u8 *)elems->ht_operation) - 2 :
+                       NULL;
                 if (ht_oper_ie && ht_oper_ie[1] >= sizeof(*ht_oper))
                         ht_oper = (void *)(ht_oper_ie + 2);

-               ht_cap_ie = ((const u8 *)elems->ht_cap_elem) - 2;
+               ht_cap_ie = elems->ht_cap_elem ?
+                       ((const u8 *)elems->ht_cap_elem) - 2 :
+                       NULL;
                 if (ht_cap_ie && ht_cap_ie[1] >= sizeof(*ht_cap))
                         ht_cap = (void *)(ht_cap_ie + 2);

@@ -5043,7 +5047,9 @@ static int ieee80211_prep_channel(struct 
ieee80211_sub_if_data *sdata,
         if (!(ifmgd->flags & IEEE80211_STA_DISABLE_VHT) && !is_6ghz) {
                 const u8 *vht_oper_ie, *vht_cap;

-               vht_oper_ie = ((const u8 *)elems->vht_operation) - 2;
+               vht_oper_ie = elems->vht_operation ?
+                       ((const u8 *)elems->vht_operation) - 2 :
+                       NULL;
                 if (vht_oper_ie && vht_oper_ie[1] >= sizeof(*vht_oper))
                         vht_oper = (void *)(vht_oper_ie + 2);
                 if (vht_oper && !ht_oper) {
@@ -5055,7 +5061,9 @@ static int ieee80211_prep_channel(struct 
ieee80211_sub_if_data *sdata,
                         ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
                 }

-               vht_cap = ((const u8 *)elems->vht_cap_elem) - 2;
+               vht_cap = elems->vht_cap_elem ?
+                       ((const u8 *)elems->vht_cap_elem) - 2 :
+                       NULL;
                 if (!vht_cap || vht_cap[1] < sizeof(struct 
ieee80211_vht_cap)) {
                         ifmgd->flags |= IEEE80211_STA_DISABLE_VHT;
                         vht_oper = NULL;
@@ -5065,7 +5073,9 @@ static int ieee80211_prep_channel(struct 
ieee80211_sub_if_data *sdata,
         if (!(ifmgd->flags & IEEE80211_STA_DISABLE_HE)) {
                 const u8 *he_oper_ie;

-               he_oper_ie = ((const u8 *)elems->he_operation) - 3;
+               he_oper_ie = elems->he_operation ?
+                       ((const u8 *)elems->he_operation) - 3 :
+                       NULL;
                 if (he_oper_ie &&
                     he_oper_ie[1] >= 
ieee80211_he_oper_size(&he_oper_ie[3]))
                         he_oper = (void *)(he_oper_ie + 3);
@@ -5117,7 +5127,9 @@ static int ieee80211_prep_channel(struct 
ieee80211_sub_if_data *sdata,
         if (sband->band == NL80211_BAND_S1GHZ) {
                 const u8 *s1g_oper_ie;

-               s1g_oper_ie = ((const u8 *)elems->s1g_oper) - 2;
+               s1g_oper_ie = elems->s1g_oper ?
+                       ((const u8 *)elems->s1g_oper) - 2 :
+                       NULL;
                 if (s1g_oper_ie && s1g_oper_ie[1] >= sizeof(*s1g_oper))
                         s1g_oper = (void *)(s1g_oper_ie + 2);
                 else


On 2021-09-03 19:48, Wen Gong wrote:
> In function ieee80211_prep_channel(), it has some 
> ieee80211_bss_get_ie()
> and cfg80211_find_ext_ie() to get the IE, this is to use another
> function ieee802_11_parse_elems() to get all the IEs in one time.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> ---
>  net/mac80211/mlme.c | 40 ++++++++++++++++++++++++----------------
>  1 file changed, 24 insertions(+), 16 deletions(-)
> 
> diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
> index 2480bd0577bb..6b32cdd590cd 100644
> --- a/net/mac80211/mlme.c
> +++ b/net/mac80211/mlme.c
> @@ -5001,10 +5001,22 @@ static int ieee80211_prep_channel(struct
> ieee80211_sub_if_data *sdata,
>  	bool is_6ghz = cbss->channel->band == NL80211_BAND_6GHZ;
>  	bool is_5ghz = cbss->channel->band == NL80211_BAND_5GHZ;
>  	struct ieee80211_bss *bss = (void *)cbss->priv;
> +	struct ieee802_11_elems *elems;
> +	const struct cfg80211_bss_ies *ies;
>  	int ret;
>  	u32 i;
>  	bool have_80mhz;
> 
> +	elems = kzalloc(sizeof(*elems), GFP_KERNEL);
> +	if (!elems)
> +		return -ENOMEM;
> +
> +	rcu_read_lock();
> +
> +	ies = rcu_dereference(cbss->ies);
> +	ieee802_11_parse_elems(ies->data, ies->len, false, elems,
> +			       NULL, NULL);
> +
>  	sband = local->hw.wiphy->bands[cbss->channel->band];
> 
>  	ifmgd->flags &= ~(IEEE80211_STA_DISABLE_40MHZ |
> @@ -5026,16 +5038,14 @@ static int ieee80211_prep_channel(struct
> ieee80211_sub_if_data *sdata,
>  	if (!ieee80211_get_he_sta_cap(sband))
>  		ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
> 
> -	rcu_read_lock();
> -
>  	if (!(ifmgd->flags & IEEE80211_STA_DISABLE_HT) && !is_6ghz) {
>  		const u8 *ht_oper_ie, *ht_cap_ie;
> 
> -		ht_oper_ie = ieee80211_bss_get_ie(cbss, WLAN_EID_HT_OPERATION);
> +		ht_oper_ie = ((const u8 *)elems->ht_operation) - 2;
>  		if (ht_oper_ie && ht_oper_ie[1] >= sizeof(*ht_oper))
>  			ht_oper = (void *)(ht_oper_ie + 2);
> 
> -		ht_cap_ie = ieee80211_bss_get_ie(cbss, WLAN_EID_HT_CAPABILITY);
> +		ht_cap_ie = ((const u8 *)elems->ht_cap_elem) - 2;
>  		if (ht_cap_ie && ht_cap_ie[1] >= sizeof(*ht_cap))
>  			ht_cap = (void *)(ht_cap_ie + 2);
> 
> @@ -5048,8 +5058,7 @@ static int ieee80211_prep_channel(struct
> ieee80211_sub_if_data *sdata,
>  	if (!(ifmgd->flags & IEEE80211_STA_DISABLE_VHT) && !is_6ghz) {
>  		const u8 *vht_oper_ie, *vht_cap;
> 
> -		vht_oper_ie = ieee80211_bss_get_ie(cbss,
> -						   WLAN_EID_VHT_OPERATION);
> +		vht_oper_ie = ((const u8 *)elems->vht_operation) - 2;
>  		if (vht_oper_ie && vht_oper_ie[1] >= sizeof(*vht_oper))
>  			vht_oper = (void *)(vht_oper_ie + 2);
>  		if (vht_oper && !ht_oper) {
> @@ -5061,7 +5070,7 @@ static int ieee80211_prep_channel(struct
> ieee80211_sub_if_data *sdata,
>  			ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
>  		}
> 
> -		vht_cap = ieee80211_bss_get_ie(cbss, WLAN_EID_VHT_CAPABILITY);
> +		vht_cap = ((const u8 *)elems->vht_cap_elem) - 2;
>  		if (!vht_cap || vht_cap[1] < sizeof(struct ieee80211_vht_cap)) {
>  			ifmgd->flags |= IEEE80211_STA_DISABLE_VHT;
>  			vht_oper = NULL;
> @@ -5069,12 +5078,9 @@ static int ieee80211_prep_channel(struct
> ieee80211_sub_if_data *sdata,
>  	}
> 
>  	if (!(ifmgd->flags & IEEE80211_STA_DISABLE_HE)) {
> -		const struct cfg80211_bss_ies *ies;
>  		const u8 *he_oper_ie;
> 
> -		ies = rcu_dereference(cbss->ies);
> -		he_oper_ie = cfg80211_find_ext_ie(WLAN_EID_EXT_HE_OPERATION,
> -						  ies->data, ies->len);
> +		he_oper_ie = ((const u8 *)elems->he_operation) - 3;
>  		if (he_oper_ie &&
>  		    he_oper_ie[1] >= ieee80211_he_oper_size(&he_oper_ie[3]))
>  			he_oper = (void *)(he_oper_ie + 3);
> @@ -5102,8 +5108,7 @@ static int ieee80211_prep_channel(struct
> ieee80211_sub_if_data *sdata,
>  	if (sband->band == NL80211_BAND_S1GHZ) {
>  		const u8 *s1g_oper_ie;
> 
> -		s1g_oper_ie = ieee80211_bss_get_ie(cbss,
> -						   WLAN_EID_S1G_OPERATION);
> +		s1g_oper_ie = ((const u8 *)elems->s1g_oper) - 2;
>  		if (s1g_oper_ie && s1g_oper_ie[1] >= sizeof(*s1g_oper))
>  			s1g_oper = (void *)(s1g_oper_ie + 2);
>  		else
> @@ -5125,7 +5130,8 @@ static int ieee80211_prep_channel(struct
> ieee80211_sub_if_data *sdata,
> 
>  	if (ifmgd->flags & IEEE80211_STA_DISABLE_HE && is_6ghz) {
>  		sdata_info(sdata, "Rejecting non-HE 6/7 GHz connection");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto out_no_lock;
>  	}
> 
>  	/* will change later if needed */
> @@ -5143,15 +5149,17 @@ static int ieee80211_prep_channel(struct
> ieee80211_sub_if_data *sdata,
>  	/* don't downgrade for 5 and 10 MHz channels, though. */
>  	if (chandef.width == NL80211_CHAN_WIDTH_5 ||
>  	    chandef.width == NL80211_CHAN_WIDTH_10)
> -		goto out;
> +		goto out_lock;
> 
>  	while (ret && chandef.width != NL80211_CHAN_WIDTH_20_NOHT) {
>  		ifmgd->flags |= ieee80211_chandef_downgrade(&chandef);
>  		ret = ieee80211_vif_use_channel(sdata, &chandef,
>  						IEEE80211_CHANCTX_SHARED);
>  	}
> - out:
> + out_lock:
>  	mutex_unlock(&local->mtx);
> + out_no_lock:
> +	kfree(elems);
>  	return ret;
>  }

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
