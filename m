Return-Path: <SRS0=GTBl=G6=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90934C433DB
	for <ath11k@archiver.kernel.org>; Wed, 27 Jan 2021 18:02:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B67764DA9
	for <ath11k@archiver.kernel.org>; Wed, 27 Jan 2021 18:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B67764DA9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/f9PQ+LynzOtA1+jZyACcr4ECAE5Ii6P6bwDnQZcScc=; b=jbWxwhYHfwSRzr4Ds3l9wCAl+
	6i/BlZmJzoL3/fBJK/AvKb72MN3UF5CbmAY0vifyNjH2XJ/zghdH/l8stIlQcITWxspyDdTXw5JwO
	eThVJdkgXr1LAQ0CupGOIqMWViRPz50+8EQ+seR3mwifDsnfuLgEq4TUz2V+BluZr4jZ/moRwdHDG
	DEJYhRz8D0l7r6LDJlYDx94UdHmipBGnH8MBjJFbByoi8JqQ9Lwu+GcXZYR6zBVMh/8sD8JfGmiz0
	bI4vMDzHQeiczSoeCgZ6dIYvCEBXsvRd5w+ft+6tBDbNGRNHlRk7/4P0VgdnG8B40fFpoNAyuIkUX
	08fU4F5VA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4p9T-0007T0-Gl; Wed, 27 Jan 2021 18:02:47 +0000
Received: from a1.mail.mailgun.net ([198.61.254.60])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4p9O-0007Rs-MR
 for ath11k@lists.infradead.org; Wed, 27 Jan 2021 18:02:45 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611770563; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=Aa8Yz4TOcxxy5SMMiNekghF7jVfm6er9unCPcWAijYw=;
 b=Z8dogOe58oOn6vZB7LlMsfH/YMkb2kjoLc8VvVIIqXYzPaDCLEMofhQeWnOmH527yDkpo77u
 jwG5/SktKrHWKDH5kRZ5N3JCpMdXjkFdcg/4KTQdvK9geVoXKHQ6+Cf0w+fFabRzbnEVcHrT
 sby+78OB1A8Ykr18dXVc74NpYp0=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6011aaa5a8db642432952973 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Jan 2021 18:02:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0025BC43461; Wed, 27 Jan 2021 18:02:12 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 41DC6C433ED;
 Wed, 27 Jan 2021 18:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 41DC6C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: Re: [PATCHv2 2/2] ath11k: Add ap power save support
References: <1598257589-19091-1-git-send-email-vnaralas@codeaurora.org>
 <1598257589-19091-2-git-send-email-vnaralas@codeaurora.org>
Date: Wed, 27 Jan 2021 20:02:08 +0200
In-Reply-To: <1598257589-19091-2-git-send-email-vnaralas@codeaurora.org>
 (Venkateswara Naralasetty's message of "Mon, 24 Aug 2020 13:56:29
 +0530")
Message-ID: <87h7n28di7.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_130243_959713_47E17E84 
X-CRM114-Status: GOOD (  18.62  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Venkateswara Naralasetty <vnaralas@codeaurora.org> writes:

> AP power save where AP goes to power save mode when no stations associate
> to it and come out of power save when any station associate to AP.
>
> This AP power save capability can be used to save power with the drawback
> of reduced range or delayed discovery of the AP
>
> This patch also porvides user configuration to enable/disable
> this feature using vendor command. This feature is disabled by default.
>
> Tested-on: IPQ8074 WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>

[...]

> +static int ath11k_vendor_set_wifi_config(struct wiphy *wihpy,

s/wihpy/wiphy/

> +					 struct wireless_dev *wdev,
> +					 const void *data,
> +					 int data_len)
> +{
> +	struct ieee80211_vif *vif;
> +	struct ath11k_vif *arvif;
> +	struct ath11k *ar;
> +	struct nlattr *tb[QCA_WLAN_VENDOR_ATTR_CONFIG_MAX + 1];
> +	int ret = 0;
> +
> +	if (!wdev)
> +		return -EINVAL;
> +
> +	vif = wdev_to_ieee80211_vif(wdev);
> +	if (!vif)
> +		return -EINVAL;
> +
> +	arvif = (struct ath11k_vif *)vif->drv_priv;
> +	if (!arvif)
> +		return -EINVAL;
> +
> +	ar = arvif->ar;
> +
> +	mutex_lock(&ar->conf_mutex);
> +
> +	ret = nla_parse(tb, QCA_WLAN_VENDOR_ATTR_CONFIG_MAX, data, data_len,
> +			ath11k_vendor_set_wifi_config_policy, NULL);
> +	if (ret) {
> +		ath11k_warn(ar->ab, "invalid set wifi config policy attribute\n");
> +		goto exit;
> +	}
> +
> +	ar->ap_ps_enabled = nla_get_flag(tb[QCA_WLAN_VENDOR_ATTR_CONFIG_GTX]);
> +	ret = ath11k_mac_ap_ps_recalc(ar);
> +	if (ret) {
> +		ath11k_warn(ar->ab, "failed to send ap ps ret %d\n", ret);
> +		goto exit;
> +	}
> +
> +exit:
> +	mutex_unlock(&ar->conf_mutex);
> +	return ret;
> +}

Something which I find awkward here is that this is per pdev (=all
vdevs), even though the vendor command is per vif. So if you change the
config on one vif, all other vifs will change as well. And there's no
way to check if the state from user space as there's only a set command
and no equivalent get command.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
