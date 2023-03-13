Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35688C61DA4
	for <ath11k@archiver.kernel.org>; Mon, 13 Mar 2023 12:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOJrQZdrlmE9bo1U2sMF+8bKpdFfaj2BauphUWqSUfw=; b=Bp/x6/9PpuWmIQ
	u1ts2gkHa2wkTexQjmQ3uzxTY8BhfgnU/p+dwEtMs1FCqpcZ+N0w6UvbYAVlNkWhXqS+NxdUn3qGu
	yffZImsKHHv+O4PerR2IzEFoMeKnMrfJ/FQ9iR15K+9Npz8zJN8yZkChDBrb3LWzLb3uv9Uo7EnDu
	hMcpilysdcf8Vsxpd1mVE24GlmP4Ubr2R5opJ9Bi4X4K978Nw+8WtYihWlNGMJBEQTx0ir8rV+gRs
	gcj9vuV7vDQ6bOenDk+VH8+4Lp+YpQN8drSI4MQxTeIuTIw15yW/R9fMyPL075CT0lNW/gguB0f66
	h7aow7FiFuCrKIiIaAFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbh74-005eJA-Fb; Mon, 13 Mar 2023 12:17:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbh71-005eIh-H3
	for ath11k@lists.infradead.org; Mon, 13 Mar 2023 12:17:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1AF0061034;
	Mon, 13 Mar 2023 12:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A4BC4339B;
	Mon, 13 Mar 2023 12:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678709830;
	bh=5SV13aq5tJjlhLGlfb0uLtr95GJYuPICvzYb8uVfPSs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=PVRsjOPYcUvXrPVS3gD6bsJsoyE0Flnzoz6LQalM+NWm9VuzGD0c9A2vUIAegPWxk
	 Zip9CzAbzUSJskQOER1441H5JdnVMOFGkD779ec5ppdL27R+spj4hu2LdyjFILtgHG
	 U6w1LQU6ECAXBMGoZWmhcxqko5dtCuewkSceGAYJo9HRn5jX8/aSWMXQ51UWIN4KrS
	 NqRlIwzRMWB1Wm3za661iHu2jR60RTN7HfvYCOUTGpxb/S/HOKaD5+KsJPWUqrtG9t
	 quWw2Q/kUU4YMeGusGUjLZiCEPRL/SHD2BcFI/LA8l+BcJ/o+pWj9pRCklkMfFocCt
	 Ebsa4k0dAk8Bg==
From: Kalle Valo <kvalo@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Govindaraj Saminathan <quic_gsaminat@quicinc.com>,  Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Subject: Re: [PATCH 1/2] wifi: ath11k: factory test mode support
References: <20230213130854.2473-1-quic_rajkbhag@quicinc.com>
	<20230213130854.2473-2-quic_rajkbhag@quicinc.com>
Date: Mon, 13 Mar 2023 14:17:05 +0200
In-Reply-To: <20230213130854.2473-2-quic_rajkbhag@quicinc.com> (Raj Kumar
	Bhagat's message of "Mon, 13 Feb 2023 18:38:53 +0530")
Message-ID: <87ilf4onge.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_051711_685309_0C5A1F9C 
X-CRM114-Status: GOOD (  31.50  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> writes:

> From: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
>
> Add support to process factory test mode commands(FTM) for calibration.
> By default firmware start with NORMAL mode and to process the FTM commands
> firmware needs to be restarted in FTM mode using module parameter ftm_mode.
> The pre-request is all the radios should be down before starting the test.
>
> When start command ATH11K_TM_CMD_TESTMODE_START is received, ar state
> is set to Test Mode. If the FTM command or event length is greater
> than 256 bytes, it will be broken down into multiple segments and
> encoded with TLV header if it is segmented commands, else it is sent
> to firmware as it is.
>
> On receiving UTF event from firmware, if it is segmented event, the driver
> will wait until it receives all the segments and notify the complete
> data to user application. In case the segmented sequence are missed or
> lost from the firmware, driver will skip the already received partial data.
>
> In case of unsegmented UTF event from firmware, driver notifies the
> data to the user application as it comes. Applications handles
> the data further.
>
> Command to boot in ftm mode
> insmod ath11k ftm_mode=1
>
> Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
> Co-developed-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

[...]

> -bool ath11k_tm_event_wmi(struct ath11k *ar, u32 cmd_id, struct sk_buff *skb)

Please do removal of this ath11k_tm_event_wmi() in a separate patch,
then it's easier to read this patch.

>  static int ath11k_tm_cmd_get_version(struct ath11k *ar, struct nlattr *tb[])
>  {
>  	struct sk_buff *skb;
> -	int ret;
>  
>  	ath11k_dbg(ar->ab, ATH11K_DBG_TESTMODE,
>  		   "testmode cmd get version_major %d version_minor %d\n",
> @@ -98,21 +205,50 @@ static int ath11k_tm_cmd_get_version(struct ath11k *ar, struct nlattr *tb[])
>  	if (!skb)
>  		return -ENOMEM;
>  
> -	ret = nla_put_u32(skb, ATH11K_TM_ATTR_VERSION_MAJOR,
> -			  ATH11K_TESTMODE_VERSION_MAJOR);
> -	if (ret) {
> +	if (nla_put_u32(skb, ATH11K_TM_ATTR_VERSION_MAJOR,
> +			ATH11K_TESTMODE_VERSION_MAJOR) ||
> +	    nla_put_u32(skb, ATH11K_TM_ATTR_VERSION_MINOR,
> +			ATH11K_TESTMODE_VERSION_MINOR)) {
>  		kfree_skb(skb);
> -		return ret;
> +		return -ENOBUFS;
>  	}
>  
> -	ret = nla_put_u32(skb, ATH11K_TM_ATTR_VERSION_MINOR,
> -			  ATH11K_TESTMODE_VERSION_MINOR);
> -	if (ret) {
> -		kfree_skb(skb);
> -		return ret;
> +	return cfg80211_testmode_reply(skb);
> +}

Please also do the changes in ath11k_tm_cmd_get_version() in a separate
patch.

> @@ -47,4 +49,21 @@ enum ath11k_tm_cmd {
>  	 * ATH11K_TM_ATTR_DATA.
>  	 */
>  	ATH11K_TM_CMD_WMI = 1,
> +
> +	/* Boots the UTF firmware, the netdev interface must be down at the
> +	 * time.
> +	 */
> +	ATH11K_TM_CMD_TESTMODE_START = 2,
> +
> +	/* Shuts down the UTF firmware and puts the driver back into OFF
> +	 * state.
> +	 */
> +	ATH11K_TM_CMD_TESTMODE_STOP = 3,

The documentation for for the STOP command is misleading, now ath11k
just ignores that command. So is there any point even to have the
command if it doesn't do anything?

> @@ -8096,6 +8128,12 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
>  	case WMI_PDEV_CSA_SWITCH_COUNT_STATUS_EVENTID:
>  		ath11k_wmi_pdev_csa_switch_count_status_event(ab, skb);
>  		break;
> +	case WMI_PDEV_UTF_EVENTID:
> +		if (test_bit(ATH11K_FLAG_FTM_SEGMENTED, &ab->dev_flags))
> +			ath11k_wmi_tm_event_segmented(ab, id, skb);
> +		else
> +			ath11k_tm_wmi_event_unsegmented(ab, id, skb);
> +		break;

I didn't investigate this in detail, but I find the flag a bit
problematic as it alters the behaviour ATH11K_FLAG_FTM_SEGMENTED and the
behaviour difference it's not documented at all in enum ath11k_tm_cmd.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
