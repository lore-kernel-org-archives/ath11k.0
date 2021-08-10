Return-Path: <SRS0=0MIV=NB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C26CC4338F
	for <ath11k@archiver.kernel.org>; Tue, 10 Aug 2021 15:44:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E745960E97
	for <ath11k@archiver.kernel.org>; Tue, 10 Aug 2021 15:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E745960E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkyvkovEaaIbOuCGuSrj46MciyEjKyEXWOZU78g25UY=; b=HHJACoNgW+2CxF9gcwgfVi08pr
	CDjOpHIy2UjEoAScD5zC/UiN1lz4fbjhPFbpCDjFqwm7xS1WdQKfEIZ1ZpKARoQT8W9t5wrQ0V+tA
	b1Jyzc7KPE0/qYxVsXtO8QeoV2pjCZPGnJ1sHvQ/gJ2goyRv6w6pDBuXzUSzavgPbi1eZsW1lExyp
	pXY89xuK26YWvUG/3Wvl277od3/CX0jVO+xLFsJVO8H3HicOUfVZLtsWQ/+Hi3gtsNzHSa4qg8zP5
	mrZZ54eHhjM8DXjLCF1IyaqmaeaDpcuNU/Cg6+g8ri/E/4U/DLllLKxkIwd+F1SV9lrj/JUYU3k/m
	hLLYHSLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDTvI-004N2b-9F; Tue, 10 Aug 2021 15:44:12 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDTvB-004N1w-8y
 for ath11k@lists.infradead.org; Tue, 10 Aug 2021 15:44:10 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628610246; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=E1wwJGhwcT0fgokIUql38ixNmO/5P8vzBcKlP7nnMgk=;
 b=On8fl9xj9L9PYLy8RFRL2CFhOethdpRsh07dqHHHiw1rb5gPZsZpYew3zwnKLUwahL12F2nv
 6n7KCnT7SUBfVFjMkdMkOQGMQktRH/JsRBRzBm5RWhYJmlBrrLWHHnNNlFZUrJzlqcvCUEVj
 AHZ/zYu5i39YL+Lkmu1dfmScKHU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61129ec1b14e7e2ecbd6eb43 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 15:44:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 486B8C433F1; Tue, 10 Aug 2021 15:44:01 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: jjohnson)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1966DC43460;
 Tue, 10 Aug 2021 15:43:59 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 10 Aug 2021 08:43:59 -0700
From: Jeff Johnson <jjohnson@codeaurora.org>
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, ath11k
 <ath11k-bounces@lists.infradead.org>
Subject: Re: [PATCH v5 1/3] nl80211: Add support for beacon tx mode
In-Reply-To: <1628585783-21139-2-git-send-email-mkenna@codeaurora.org>
References: <1628585783-21139-1-git-send-email-mkenna@codeaurora.org>
 <1628585783-21139-2-git-send-email-mkenna@codeaurora.org>
Message-ID: <1c6e3e783ef437c3b8d83aeb19ec0760@codeaurora.org>
X-Sender: jjohnson@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_084406_891981_CC6F3EB6 
X-CRM114-Status: GOOD (  33.50  )
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

On 2021-08-10 01:56, Maharaja Kennadyrajan wrote:
> User can configure the below beacon tx mode
> 1. Staggered mode and 2. Burst mode while bring-up the AP
> or MESH.
> 
> Beacons can be sent out in burst(continuously in a single shot
> one after another) or staggered (equally spread out over beacon
> interval) mode.
> 
> Set the beacon_tx_mode as 1 for Staggered mode and 2 for
> burst mode.
> 
> Hence, added the support in the nl80211/cfg80211
> layer to honour the beacon tx mode configuration and pass
> this value to the driver.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00630-QCAHKSWPL_SILICONZ-2
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> ---
> 
> V5: Addressed Johannes's & Felix's comments on v4 patch.
> 
> V4: Rebases on latest ath.git TOT.
> 
> V3: Addressed Johnson's comment on v2 patch.
> 
> V2: Addressed Johannes's comment on v1 patch.
> 
>  include/net/cfg80211.h       |  4 ++++
>  include/uapi/linux/nl80211.h | 20 ++++++++++++++++++++
>  net/wireless/nl80211.c       | 11 +++++++++++
>  3 files changed, 35 insertions(+)
> 
> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
> index 161cdf7..8c3777b 100644
> --- a/include/net/cfg80211.h
> +++ b/include/net/cfg80211.h
> @@ -1189,6 +1189,7 @@ enum cfg80211_ap_settings_flags {
>   * @he_oper: HE operation IE (or %NULL if HE isn't enabled)
>   * @fils_discovery: FILS discovery transmission parameters
>   * @unsol_bcast_probe_resp: Unsolicited broadcast probe response
> parameters
> + * @beacon_tx_mode: Beacon Tx Mode setting
>   */
>  struct cfg80211_ap_settings {
>  	struct cfg80211_chan_def chandef;
> @@ -1221,6 +1222,7 @@ struct cfg80211_ap_settings {
>  	struct cfg80211_he_bss_color he_bss_color;
>  	struct cfg80211_fils_discovery fils_discovery;
>  	struct cfg80211_unsol_bcast_probe_resp unsol_bcast_probe_resp;
> +	enum nl80211_beacon_tx_mode beacon_tx_mode;
>  };
> 
>  /**
> @@ -2066,6 +2068,7 @@ struct mesh_config {
>   *	to operate on DFS channels.
>   * @control_port_over_nl80211: TRUE if userspace expects to exchange
> control
>   *	port frames over NL80211 instead of the network interface.
> + * @beacon_tx_mode: Beacon Tx Mode setting.
>   *
>   * These parameters are fixed when the mesh is created.
>   */
> @@ -2089,6 +2092,7 @@ struct mesh_setup {
>  	struct cfg80211_bitrate_mask beacon_rate;
>  	bool userspace_handles_dfs;
>  	bool control_port_over_nl80211;
> +	enum nl80211_beacon_tx_mode beacon_tx_mode;
>  };
> 
>  /**
> diff --git a/include/uapi/linux/nl80211.h 
> b/include/uapi/linux/nl80211.h
> index db47499..29c6429 100644
> --- a/include/uapi/linux/nl80211.h
> +++ b/include/uapi/linux/nl80211.h
> @@ -2560,6 +2560,13 @@ enum nl80211_commands {
>   *	disassoc events to indicate that an immediate reconnect to the AP
>   *	is desired.
>   *
> + * @NL80211_ATTR_BEACON_TX_MODE: used to configure the beacon tx mode
> (u32),
> + *	as specified in the &enum nl80211_beacon_tx_mode. The user-space
> + *	shall use this attribute to configure the tx mode of beacons.

s/shall/can/
'shall' implies a required action whereas 'can' implies an optional 
action

> + *	Beacons can be sent out in burst(continuously in a single shot
> + *	one after another) or staggered (equally spread out over beacon
> + *	interval) mode.
> + *
>   * @NUM_NL80211_ATTR: total number of nl80211_attrs available
>   * @NL80211_ATTR_MAX: highest attribute number currently defined
>   * @__NL80211_ATTR_AFTER_LAST: internal use
> @@ -3057,6 +3064,8 @@ enum nl80211_attrs {
> 
>  	NL80211_ATTR_DISABLE_HE,
> 
> +	NL80211_ATTR_BEACON_TX_MODE,
> +
>  	/* add attributes here, update the policy in nl80211.c */
> 
>  	__NL80211_ATTR_AFTER_LAST,
> @@ -7306,4 +7315,15 @@ enum nl80211_sar_specs_attrs {
>  	NL80211_SAR_ATTR_SPECS_MAX = __NL80211_SAR_ATTR_SPECS_LAST - 1,
>  };
> 
> +/**
> + * enum nl80211_beacon_tx_mode - Beacon Tx Mode enum.
> + * @NL80211_BEACON_STAGGERED_MODE: Used to configure beacon tx mode as
> + *	staggered mode. This is the default beacon tx mode.
> + * @NL80211_BEACON_BURST_MODE: Used to configure beacon tx mode as 
> burst
> mode.
> + */
> +enum nl80211_beacon_tx_mode {

what happened to 0?

now we're back to the issue that I originally reported that if the 
attribute is not present you send 0 to the driver which is not a valid 
enumeration
See my additional comments further below

> +	NL80211_BEACON_STAGGERED_MODE = 1,
> +	NL80211_BEACON_BURST_MODE = 2,
> +};
> +
>  #endif /* __LINUX_NL80211_H */
> diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
> index 50eb405..c00e326 100644
> --- a/net/wireless/nl80211.c
> +++ b/net/wireless/nl80211.c
> @@ -759,6 +759,9 @@ static const struct nla_policy
> nl80211_policy[NUM_NL80211_ATTR] = {
>  	[NL80211_ATTR_RECONNECT_REQUESTED] = { .type = NLA_REJECT },
>  	[NL80211_ATTR_SAR_SPEC] = NLA_POLICY_NESTED(sar_policy),
>  	[NL80211_ATTR_DISABLE_HE] = { .type = NLA_FLAG },
> +	[NL80211_ATTR_BEACON_TX_MODE] =
> +		NLA_POLICY_RANGE(NLA_U32, NL80211_BEACON_STAGGERED_MODE,
> +				 NL80211_BEACON_BURST_MODE),
>  };
> 
>  /* policy for the key attributes */
> @@ -5346,6 +5349,10 @@ static int nl80211_start_ap(struct sk_buff *skb,
> struct genl_info *info)
>  	params.dtim_period =
>  		nla_get_u32(info->attrs[NL80211_ATTR_DTIM_PERIOD]);
> 
> +	if (info->attrs[NL80211_ATTR_BEACON_TX_MODE])
> +		params.beacon_tx_mode =
> +
> nla_get_u32(info->attrs[NL80211_ATTR_BEACON_TX_MODE]);
> +
>  	err = cfg80211_validate_beacon_int(rdev,
> dev->ieee80211_ptr->iftype,
>  					   params.beacon_interval);
>  	if (err)
> @@ -11900,6 +11907,10 @@ static int nl80211_join_mesh(struct sk_buff 
> *skb,
> struct genl_info *info)
>  			return -EINVAL;
>  	}
> 
> +	if (info->attrs[NL80211_ATTR_BEACON_TX_MODE])
> +		setup.beacon_tx_mode =
> +
> nla_get_u32(info->attrs[NL80211_ATTR_BEACON_TX_MODE]);
> +

if you are not going to have an enum for default = 0 then you need an 
else to set
beacon_tx_mode = NL80211_BEACON_STAGGERED_MODE


>  	if (info->attrs[NL80211_ATTR_MESH_SETUP]) {
>  		/* parse additional setup parameters if given */
>  		err = nl80211_parse_mesh_setup(info, &setup);
> --
> 2.7.4

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
