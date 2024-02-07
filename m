Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E7DC4828D
	for <ath11k@archiver.kernel.org>; Wed,  7 Feb 2024 09:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jox79ziXLwjcsabKMKwPbrx4c/YouQgYt5k7myNBuTA=; b=eKbnSPJVbTVVcimERojT89ppWw
	PLPTv8GiHl8gl8tkdXZ2B73RJ12CYLfEKJQY+fJnUkzyBDrY98gNO8tSuY+SPY97WRTsJEnLDDowl
	JlHHcXPZHb5bYEfiqakMRFiYwMQomWQQjSIHH7iDs8Bvk//ZLhJvicxVc05oVK00aDoPb5erQP3zE
	oi5qwdh6+ViLSlBstlBW2EDvJ93uk8b23yhPT7MbZYaV1XFE5BfeTpr8SCW7gtaegUkg/nASFEmOF
	Bnk1jX94T0SRxPGg6nA9hn+WmbDwSt6Z7zGJbOVZW2bA7LuteURoEj0wvpAtrp1MTl+PYNSN4FoxT
	c1MO4WbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXebD-0000000AGBg-2h7e;
	Wed, 07 Feb 2024 09:52:11 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXebB-0000000AGAx-2xUP
	for ath11k@lists.infradead.org;
	Wed, 07 Feb 2024 09:52:10 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a3856588ba8so57814066b.1
        for <ath11k@lists.infradead.org>; Wed, 07 Feb 2024 01:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707299526; x=1707904326; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jox79ziXLwjcsabKMKwPbrx4c/YouQgYt5k7myNBuTA=;
        b=cbZYUWD+n5mZIam7pqW3E92Uj4wM5MhM1ptEShkQZO1GIiFE4V7HZE//nOxZGfk5Xv
         VgmdQBhygaIxQ97k8cvM7EMFuM6aLHm1CwYWTsnhXIwbA88JtNBRfWlC3GrkzXRqkZFd
         ZplfjDSStI3Vjt592TjZKM/7WIOpZvcH5RafzCHLzas1wN1yFz6GtYUc8e3C+T65ai9k
         5b3Bfbv9BHZE0Z7YaSGTDyI9f9uvMlm0bOOaE2RfmrVVySmTiCQiBw6fUm8jqAIvrOjx
         O2MZpw1BqF++IQ0RM33VrHW3EyQ56bHgrX6YMVbR6QqY+imZaii2gNRT0VQMRS+uoOpQ
         /h/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707299526; x=1707904326;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jox79ziXLwjcsabKMKwPbrx4c/YouQgYt5k7myNBuTA=;
        b=un9yL3liQxWxiANlqQOKiIL/tMc5uzpZqjrYZCbc/M9DYFfaPQFCQMyAxvN6lCTRE0
         4u3VnZ9GlUQaSkMlNdPqrHXPlYySSLkYTS5/xcG+VPdSes512o0n9YN36DyHXYBAX3vq
         OsM3FWDtXVCY3ijtvQr+/yYveaRNgSwgfEPemKo20sTrMuRUXlNs9hMYqheX/L5BkuTC
         JZTG9f/oGhOnUhwhWLDw4F4zTaf31LxD7uQCzyTTPCiCq6/V4RiqVUMDyJ6x7hd0VOA5
         7wBIo2Oy29RI2FgPmweLwDMn/fY2uxrkzHmW3MVgbhBGMc9YsyZ/84N9NG0lpidLs38h
         oPVQ==
X-Gm-Message-State: AOJu0YxfOTwQ1atgqc0wEuilyth1pvlryIJvDtWO7szroiixo+x1WSiR
	3pOg+sLY5BfRmNulqXWAt25FqzYtg12ydD4l3Nk0GmMQ5CvUxt5jBSG+JJgCUdc=
X-Google-Smtp-Source: AGHT+IHJ0CRiwTOYC3vSHwTWUv2DcruGlDmREkHICA/GkWJni8bkkAAQ7usrLJxExt36b5PlYkwG3g==
X-Received: by 2002:a17:907:3ad7:b0:a38:200d:f96 with SMTP id fi23-20020a1709073ad700b00a38200d0f96mr2891067ejc.59.1707299526175;
        Wed, 07 Feb 2024 01:52:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVu8hC9/Khy1NUh3dBqF3eLezCKwUco5JnyWLGI8kAiHY1r22cdhba6r+1N6IQcMs4yWCemlTbrW6DRq/A9t9oZU6RFzi6ffF4=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id vu3-20020a170907a64300b00a378377030csm565675ejc.41.2024.02.07.01.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 01:52:05 -0800 (PST)
Date: Wed, 7 Feb 2024 12:52:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: quic_wgong@quicinc.com
Cc: ath11k@lists.infradead.org
Subject: [bug report] wifi: ath11k: fill parameters for vdev set tpc power
 WMI command
Message-ID: <14df3ef0-b86a-474e-b0b7-92f9bf434410@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_015209_779061_CF7B5F47 
X-CRM114-Status: UNSURE (   6.78  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hello Wen Gong,

The patch 92425f788fee: "wifi: ath11k: fill parameters for vdev set
tpc power WMI command" from Jan 11, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/net/wireless/ath/ath11k/mac.c:7751 ath11k_mac_fill_reg_tpc_info()
	error: uninitialized symbol 'eirp_power'.

drivers/net/wireless/ath/ath11k/mac.c
    7583 void ath11k_mac_fill_reg_tpc_info(struct ath11k *ar,
    7584                                   struct ieee80211_vif *vif,
    7585                                   struct ieee80211_chanctx_conf *ctx)
    7586 {
    7587         struct ath11k_base *ab = ar->ab;
    7588         struct ath11k_vif *arvif = (void *)vif->drv_priv;
    7589         struct ieee80211_bss_conf *bss_conf = &vif->bss_conf;
    7590         struct ath11k_reg_tpc_power_info *reg_tpc_info = &arvif->reg_tpc_info;
    7591         struct ieee80211_channel *chan, *temp_chan;
    7592         u8 pwr_lvl_idx, num_pwr_levels, pwr_reduction;
    7593         bool is_psd_power = false, is_tpe_present = false;
    7594         s8 max_tx_power[IEEE80211_MAX_NUM_PWR_LEVEL],
    7595                 psd_power, tx_power, eirp_power;
    7596         u16 start_freq, center_freq;
    7597 
    7598         chan = ctx->def.chan;
    7599         start_freq = ath11k_mac_get_6ghz_start_frequency(&ctx->def);
    7600         pwr_reduction = bss_conf->pwr_reduction;
    7601 
    7602         if (arvif->reg_tpc_info.num_pwr_levels) {
    7603                 is_tpe_present = true;
    7604                 num_pwr_levels = arvif->reg_tpc_info.num_pwr_levels;
    7605         } else {
    7606                 num_pwr_levels = ath11k_mac_get_num_pwr_levels(&ctx->def);
    7607         }
    7608 
    7609         for (pwr_lvl_idx = 0; pwr_lvl_idx < num_pwr_levels; pwr_lvl_idx++) {
    7610                 /* STA received TPE IE*/
    7611                 if (is_tpe_present) {
    7612                         /* local power is PSD power*/
    7613                         if (chan->flags & IEEE80211_CHAN_PSD) {
    7614                                 /* Connecting AP is psd power */
    7615                                 if (reg_tpc_info->is_psd_power) {
    7616                                         is_psd_power = true;
    7617                                         ath11k_mac_get_psd_channel(ar, 20,
    7618                                                                    &start_freq,
    7619                                                                    &center_freq,
    7620                                                                    pwr_lvl_idx,
    7621                                                                    &temp_chan,
    7622                                                                    &tx_power);
    7623                                         psd_power = temp_chan->psd;
    7624                                         eirp_power = tx_power;
    7625                                         max_tx_power[pwr_lvl_idx] =
    7626                                                 min_t(s8,
    7627                                                       psd_power,
    7628                                                       reg_tpc_info->tpe[pwr_lvl_idx]);
    7629                                 /* Connecting AP is not psd power */
    7630                                 } else {
    7631                                         ath11k_mac_get_eirp_power(ar,
    7632                                                                   &start_freq,
    7633                                                                   &center_freq,
    7634                                                                   pwr_lvl_idx,
    7635                                                                   &temp_chan,
    7636                                                                   &ctx->def,
    7637                                                                   &tx_power);
    7638                                         psd_power = temp_chan->psd;
    7639                                         /* convert psd power to EIRP power based
    7640                                          * on channel width
    7641                                          */
    7642                                         tx_power =
    7643                                                 min_t(s8, tx_power,
    7644                                                       psd_power + 13 + pwr_lvl_idx * 3);
    7645                                         max_tx_power[pwr_lvl_idx] =
    7646                                                 min_t(s8,
    7647                                                       tx_power,
    7648                                                       reg_tpc_info->tpe[pwr_lvl_idx]);

There a couple of else paths where eirp_power doesn't get set.

    7649                                 }
    7650                         /* local power is not PSD power */
    7651                         } else {
    7652                                 /* Connecting AP is psd power */
    7653                                 if (reg_tpc_info->is_psd_power) {
    7654                                         is_psd_power = true;
    7655                                         ath11k_mac_get_psd_channel(ar, 20,
    7656                                                                    &start_freq,
    7657                                                                    &center_freq,
    7658                                                                    pwr_lvl_idx,
    7659                                                                    &temp_chan,
    7660                                                                    &tx_power);
    7661                                         eirp_power = tx_power;
    7662                                         max_tx_power[pwr_lvl_idx] =
    7663                                                 reg_tpc_info->tpe[pwr_lvl_idx];
    7664                                 /* Connecting AP is not psd power */
    7665                                 } else {
    7666                                         ath11k_mac_get_eirp_power(ar,
    7667                                                                   &start_freq,
    7668                                                                   &center_freq,
    7669                                                                   pwr_lvl_idx,
    7670                                                                   &temp_chan,
    7671                                                                   &ctx->def,
    7672                                                                   &tx_power);
    7673                                         max_tx_power[pwr_lvl_idx] =
    7674                                                 min_t(s8,
    7675                                                       tx_power,
    7676                                                       reg_tpc_info->tpe[pwr_lvl_idx]);

Here too.

    7677                                 }
    7678                         }
    7679                 /* STA not received TPE IE */
    7680                 } else {
    7681                         /* local power is PSD power*/
    7682                         if (chan->flags & IEEE80211_CHAN_PSD) {
    7683                                 is_psd_power = true;
    7684                                 ath11k_mac_get_psd_channel(ar, 20,
    7685                                                            &start_freq,
    7686                                                            &center_freq,
    7687                                                            pwr_lvl_idx,
    7688                                                            &temp_chan,
    7689                                                            &tx_power);
    7690                                 psd_power = temp_chan->psd;
    7691                                 eirp_power = tx_power;
    7692                                 max_tx_power[pwr_lvl_idx] = psd_power;
    7693                         } else {
    7694                                 ath11k_mac_get_eirp_power(ar,
    7695                                                           &start_freq,
    7696                                                           &center_freq,
    7697                                                           pwr_lvl_idx,
    7698                                                           &temp_chan,
    7699                                                           &ctx->def,
    7700                                                           &tx_power);
    7701                                 max_tx_power[pwr_lvl_idx] = tx_power;

And here.

    7702                         }
    7703                 }
    7704 
    7705                 if (is_psd_power) {
    7706                         /* If AP local power constraint is present */
    7707                         if (pwr_reduction)
    7708                                 eirp_power = eirp_power - pwr_reduction;

You'd have to hit an else path here as well.  Probably it can't actually
hit all the else paths and be uninitialized...  Hard to tell.

    7709 
    7710                         /* If firmware updated max tx power is non zero, then take
    7711                          * the min of firmware updated ap tx power
    7712                          * and max power derived from above mentioned parameters.
    7713                          */
    7714                         ath11k_dbg(ab, ATH11K_DBG_MAC,
    7715                                    "eirp power : %d firmware report power : %d\n",
    7716                                    eirp_power, ar->max_allowed_tx_power);
    7717                         /* Firmware reports lower max_allowed_tx_power during vdev
    7718                          * start response. In case of 6 GHz, firmware is not aware
    7719                          * of EIRP power unless driver sets EIRP power through WMI
    7720                          * TPC command. So radio which does not support idle power
    7721                          * save can set maximum calculated EIRP power directly to
    7722                          * firmware through TPC command without min comparison with
    7723                          * vdev start response's max_allowed_tx_power.
    7724                          */
    7725                         if (ar->max_allowed_tx_power && ab->hw_params.idle_ps)
    7726                                 eirp_power = min_t(s8,
    7727                                                    eirp_power,
    7728                                                    ar->max_allowed_tx_power);
    7729                 } else {
    7730                         /* If AP local power constraint is present */
    7731                         if (pwr_reduction)
    7732                                 max_tx_power[pwr_lvl_idx] =
    7733                                         max_tx_power[pwr_lvl_idx] - pwr_reduction;
    7734                         /* If firmware updated max tx power is non zero, then take
    7735                          * the min of firmware updated ap tx power
    7736                          * and max power derived from above mentioned parameters.
    7737                          */
    7738                         if (ar->max_allowed_tx_power && ab->hw_params.idle_ps)
    7739                                 max_tx_power[pwr_lvl_idx] =
    7740                                         min_t(s8,
    7741                                               max_tx_power[pwr_lvl_idx],
    7742                                               ar->max_allowed_tx_power);
    7743                 }
    7744                 reg_tpc_info->chan_power_info[pwr_lvl_idx].chan_cfreq = center_freq;
    7745                 reg_tpc_info->chan_power_info[pwr_lvl_idx].tx_power =
    7746                         max_tx_power[pwr_lvl_idx];
    7747         }
    7748 
    7749         reg_tpc_info->num_pwr_levels = num_pwr_levels;
    7750         reg_tpc_info->is_psd_power = is_psd_power;
--> 7751         reg_tpc_info->eirp_power = eirp_power;
    7752         reg_tpc_info->ap_power_type =
    7753                 ath11k_reg_ap_pwr_convert(vif->bss_conf.power_type);
    7754 }

regards,
dan carpenter

