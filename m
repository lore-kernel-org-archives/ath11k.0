Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44806C48260
	for <ath11k@archiver.kernel.org>; Thu,  8 Feb 2024 10:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5S7QpmxCjT2YxLNxecd1RH4fQFfkdJuIg+4q3qnFpcg=; b=EH5oH6aUbGh/0ncqZFt+nbMA+d
	d9aAb5TJv/B8dG/3RrlaN3TlsO6LKwi9OOvg1GijmlkdAJW6huKjRE2asxeRmDhtjQlz4p+YTUkqZ
	yBXSsG1/zK06c1ZRKa1LRvJpYIq/hGspRPa+xUP2FN1ZFOki1Zx7rptMVNs4HVxlJKvSh7SGLO6na
	i76ruoDcx20wQjxmE7hhexQQDPgD60ZWb5jkoJIs8Q08iuYei1B8X8qbxs3KUnCg6e0bOWneH7kzw
	fDGXUa9eLOmbABURlCdpW09AwFg+j9bqH9B7w9c/2pyK2p7Gb0lIShAgmxUntbjccnYOcxCsApdl6
	9Wi7N9Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY1SG-0000000DJW2-2EcX;
	Thu, 08 Feb 2024 10:16:28 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY1SD-0000000DJTX-2O8e
	for ath11k@lists.infradead.org;
	Thu, 08 Feb 2024 10:16:26 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5610b9855a8so668123a12.0
        for <ath11k@lists.infradead.org>; Thu, 08 Feb 2024 02:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707387373; x=1707992173; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5S7QpmxCjT2YxLNxecd1RH4fQFfkdJuIg+4q3qnFpcg=;
        b=LWsybiOcyiVLFRh2Y7TBcF/FDp40OIN/UU9aBjhb9LZJIbUydPGI4yr++xwVVukF2A
         IpOjFkfsyUc3r95dLrqcMuiQQilrmik9AgQXeqbAVyf7x9O8CUAdNSymYMFjTv3IlNNf
         8cuPX+FoSD5dRUakr92VGhpEl5aAj2m1E0DXipsW59WQjErZkW3PWl1u8OgtgIzhSprd
         YWIESlMIsrs4Lo+dpFTMu5xafnrwVY5MxQVUoIguQGLGqo04vS5xARsL92Zc5+0MAKux
         bEp9UhH+moUZ0guON4xfcSQuRGcNw5VLGxwq6S3JjBXO0Z81Tx9Q/Q1HI7mgD5kFCLXI
         RhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707387373; x=1707992173;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5S7QpmxCjT2YxLNxecd1RH4fQFfkdJuIg+4q3qnFpcg=;
        b=BOLJCVQMhhS+2SCbqDmXaMNoqaApbBsV61HecR4MMs87Mm5R782IcL+5Lr34b+yto/
         vEtW8td5iEVAQmwM933BseIaiQQA96BYj0x/qp8957+kbKr+bQM5vt9TxkpTHfc7eR8y
         kzWPldNgoXXukd2pDtAoEn/yXru/QXUpIEiOPj5AUER2UCf+6wfuYvPzlhjZ2+hTa50p
         dCLz2sealqOKIZY/et8Dvoxl9VRRp6h+CMK6qNeJUJORZe8+gJzX62jSqZdGXYH9jnGV
         Q7vAd6H1T2JfOUExGFmonGxSGrHhpDZocPr2Za6q/ZeEf6ntH9i72cmW+n7LMnNAbf6d
         G3kw==
X-Gm-Message-State: AOJu0YyvUtSYDJ1/KJfaS9q21wdOUs7+GDoyPW62ZPqdDcn1lMYlaSIp
	O+4qY++BokmLkBMHEFcBLyxqhIhATy0PXzi0uj2SplFceoBfN4QaDpdOC9/Iicw=
X-Google-Smtp-Source: AGHT+IFH+hFOG6OSyH6BsGPzHBevDybaiHDLTLs+FjFH4LjJqz/K4Cm3KUx2am20ArzWQH7niG9l7g==
X-Received: by 2002:a17:906:71d0:b0:a38:5443:f4e0 with SMTP id i16-20020a17090671d000b00a385443f4e0mr1979185ejk.19.1707387372972;
        Thu, 08 Feb 2024 02:16:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJGFwwT3eUM+gIRM41vp4wDDOK3yI1yCLY12ab3qK4gw++bADVrl3BSBB955U7QmuxsizqJMobFxkqNExEeA7qHsNs/kwFbPI=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id gx3-20020a170906f1c300b00a36f9941d6dsm1728871ejb.112.2024.02.08.02.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 02:16:12 -0800 (PST)
Date: Thu, 8 Feb 2024 13:16:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: lorenzo@kernel.org
Cc: ath11k@lists.infradead.org
Subject: [bug report] wifi: mac80211: add gfp_t parameter to
 ieeee80211_obss_color_collision_notify
Message-ID: <dcbc1a21-20e4-47e6-8a1c-321a2666e255@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_021625_630437_3462B982 
X-CRM114-Status: UNSURE (   5.63  )
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

Hello Lorenzo Bianconi,

The patch 03895c8414d7: "wifi: mac80211: add gfp_t parameter to
ieeee80211_obss_color_collision_notify" from Jun 17, 2022
(linux-next), leads to the following Smatch static checker warning:

	drivers/net/wireless/ath/ath11k/wmi.c:4023 ath11k_wmi_obss_color_collision_event()
	warn: sleeping in atomic context

drivers/net/wireless/ath/ath11k/wmi.c
    3989 static void
    3990 ath11k_wmi_obss_color_collision_event(struct ath11k_base *ab, struct sk_buff *skb)
    3991 {
    3992         const void **tb;
    3993         const struct wmi_obss_color_collision_event *ev;
    3994         struct ath11k_vif *arvif;
    3995         int ret;
    3996 
    3997         tb = ath11k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
    3998         if (IS_ERR(tb)) {
    3999                 ret = PTR_ERR(tb);
    4000                 ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
    4001                 return;
    4002         }
    4003 
    4004         ath11k_dbg(ab, ATH11K_DBG_WMI, "event obss color collision");
    4005 
    4006         rcu_read_lock();
                 ^^^^^^^^^^^^^^^
Preempt disabled.

    4007 
    4008         ev = tb[WMI_TAG_OBSS_COLOR_COLLISION_EVT];
    4009         if (!ev) {
    4010                 ath11k_warn(ab, "failed to fetch obss color collision ev");
    4011                 goto exit;
    4012         }
    4013 
    4014         arvif = ath11k_mac_get_arvif_by_vdev_id(ab, ev->vdev_id);
    4015         if (!arvif) {
    4016                 ath11k_warn(ab, "failed to find arvif with vedv id %d in obss_color_collision_event\n",
    4017                             ev->vdev_id);
    4018                 goto exit;
    4019         }
    4020 
    4021         switch (ev->evt_type) {
    4022         case WMI_BSS_COLOR_COLLISION_DETECTION:
--> 4023                 ieee80211_obss_color_collision_notify(arvif->vif, ev->obss_color_bitmap,
    4024                                                       GFP_KERNEL);
                                                               ^^^^^^^^^^
Smatch basically counts every GFP_KERNEL as a sleep, but actually, here
the GFP_KERNEL is not used.

    4025                 ath11k_dbg(ab, ATH11K_DBG_WMI,
    4026                            "OBSS color collision detected vdev:%d, event:%d, bitmap:%08llx\n",
    4027                            ev->vdev_id, ev->evt_type, ev->obss_color_bitmap);
    4028                 break;
    4029         case WMI_BSS_COLOR_COLLISION_DISABLE:
    4030         case WMI_BSS_COLOR_FREE_SLOT_TIMER_EXPIRY:
    4031         case WMI_BSS_COLOR_FREE_SLOT_AVAILABLE:
    4032                 break;
    4033         default:
    4034                 ath11k_warn(ab, "received unknown obss color collision detection event\n");
    4035         }
    4036 
    4037 exit:
    4038         kfree(tb);
    4039         rcu_read_unlock();
    4040 }

regards,
dan carpenter

