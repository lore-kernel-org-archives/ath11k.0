Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33B0C47DDB
	for <ath11k@archiver.kernel.org>; Mon, 29 Jan 2024 18:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouOLO2+L3N6DbaX5OPZoh5ZOu4yXD4sALxVz9wwuB+k=; b=kbX0xmrcgOG5J2dkqqi09VamRc
	cpHg1IAPWTN/aen1gt7rhRBkr+jbSK5dJ8wqHaqHb4u4FZpf4NVXlAW4mT+G+VZcnx/bzvVbF2HOV
	qtw6bPfIUFEb9K0obbnXqtg4wbs8PUWXO+dAeXinWwUmIdE6nEI0bhgOl2tq3cSMzyWbxYuyvhsgb
	l4cc8rGGwzt6hK7uFgB5R0EMZu6QHwLLCoVnZyg9o7aBc9gQeKKJ9azE6sXDx4It2h+Rt662ILGZL
	WCInwENA1fOtHFmeAykCgmsgO/ZQfiBGVd8MnCeyU1sCAOfO1AJRVpBcJSxTlGc9sSd5rCy/xCGfP
	lXB/X1ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUWmc-0000000E209-0lfa;
	Mon, 29 Jan 2024 18:55:02 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUWmZ-0000000E1yc-2fAj
	for ath11k@lists.infradead.org;
	Mon, 29 Jan 2024 18:55:01 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-68c3ac1fdb9so18750846d6.2
        for <ath11k@lists.infradead.org>; Mon, 29 Jan 2024 10:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706554497; x=1707159297; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ouOLO2+L3N6DbaX5OPZoh5ZOu4yXD4sALxVz9wwuB+k=;
        b=RVkj6QHwQPFGKBz2tDqwCCx207CG7PayclU5SLqnUv7N+00tI+mZAJMXV1x5Xfi4+5
         Ev/qaiKt0dGryM3s4NdOj8tYZ9p+IvexmZfUzaoMSia162sXp13GrZ0k8Byp5SMX0Wtx
         EKkPj4dazlyrL+DteIKbPy40Qj9MtbFRDdV3dzkOBnC27+M2PppnMYtPLBTYCIzJv3fE
         07PDJtPT0kM5YQ9Os7sKyyRqDtHxtjSBr0cx85XSMcv753dCztL2RMwQRTyf+WvuEZcm
         foo3Yn+FulAiYeEVM6C3vsIPmyHXuAx00o6yaXqaIEUbBu2zhz49kRtPRGumIQRPogn5
         mkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706554497; x=1707159297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ouOLO2+L3N6DbaX5OPZoh5ZOu4yXD4sALxVz9wwuB+k=;
        b=lDAdJ5tn6Bvo6m+XTNjtujFrQCo89YGpD81blSlBssGWYcxhyR870ziGXB+6h9GxBO
         +TqNelPews/JwY0GUFO3qHzw776zznn/bZyALnAOd6s0gfUcyo/7zzsJCp3gzE5LbcQB
         Yi8UcKarxkkgqhW1vyn5TTRRxZ8zcpsjfCDEP3SO7V9qpkA4sTmjiOBAUT9Sz4sPr5I0
         cY5AhNpfrSVVSdOeKMBoJg+LTPp/BiS+LdWrMFPlcHeg9OBLN8c+GEh+EaXbOoivqesF
         /BRxr6/EwE76px1dSTxQApNZfS8wKpwy1GsEHTckLYfZLB9ZHwrbv6vEcXbYrsG03TIF
         s3GA==
X-Gm-Message-State: AOJu0YwxxSORTZwsPwy0xSuyqaESXhPtf0jpzLDOqSjZ/pw9K80QuQ75
	UdHyZsXwNpH6tEqC0KpA01axEM2FxF7O6eu4CPg6cJePMs4+bkSf
X-Google-Smtp-Source: AGHT+IGypV+j40jEGbX3D7XA9TgFIvXIwEY4QXQ0QT/in/TAjD25yASmOFL9S5pwa4okMF02tOb9wA==
X-Received: by 2002:a05:6214:d6a:b0:685:7e91:b423 with SMTP id 10-20020a0562140d6a00b006857e91b423mr7672345qvs.11.1706554497041;
        Mon, 29 Jan 2024 10:54:57 -0800 (PST)
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id nc7-20020a0562142dc700b00686ad7daabesm3678323qvb.28.2024.01.29.10.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 10:54:56 -0800 (PST)
Message-ID: <415dd799-d824-4b0d-8c9a-60f67ff3f0b8@gmail.com>
Date: Mon, 29 Jan 2024 10:54:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] wifi: ath11k: fix connection failure due to
 unexpected peer delete
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20240123025700.2929-1-quic_bqiang@quicinc.com>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <20240123025700.2929-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_105459_713419_01ADCF01 
X-CRM114-Status: GOOD (  19.23  )
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

Hi Baochen,

On 1/22/24 6:56 PM, Baochen Qiang wrote:
> Currently ath11k_mac_op_unassign_vif_chanctx() deletes peer but
> ath11k_mac_op_assign_vif_chanctx() doesn't create it. This results in
> connection failure if MAC80211 calls drv_unassign_vif_chanctx() and
> drv_assign_vif_chanctx() during AUTH and ASSOC, see below log:
>
> [  102.372431] wlan0: authenticated
> [  102.372585] ath11k_pci 0000:01:00.0: wlan0: disabling HT/VHT/HE as WMM/QoS is not supported by the AP
> [  102.372593] ath11k_pci 0000:01:00.0: mac chanctx unassign ptr ffff895084638598 vdev_id 0
> [  102.372808] ath11k_pci 0000:01:00.0: WMI vdev stop id 0x0
> [  102.383114] ath11k_pci 0000:01:00.0: vdev stopped for vdev id 0
> [  102.384689] ath11k_pci 0000:01:00.0: WMI peer delete vdev_id 0 peer_addr 20:e5:2a:21:c4:51
> [  102.396676] ath11k_pci 0000:01:00.0: htt peer unmap vdev 0 peer 20:e5:2a:21:c4:51 id 3
> [  102.396711] ath11k_pci 0000:01:00.0: peer delete resp for vdev id 0 addr 20:e5:2a:21:c4:51
> [  102.396722] ath11k_pci 0000:01:00.0: mac removed peer 20:e5:2a:21:c4:51  vdev 0 after vdev stop
> [  102.396780] ath11k_pci 0000:01:00.0: mac chanctx assign ptr ffff895084639c18 vdev_id 0
> [  102.400628] wlan0: associate with 20:e5:2a:21:c4:51 (try 1/3)
> [  102.508864] wlan0: associate with 20:e5:2a:21:c4:51 (try 2/3)
> [  102.612815] wlan0: associate with 20:e5:2a:21:c4:51 (try 3/3)
> [  102.720846] wlan0: association with 20:e5:2a:21:c4:51 timed out
>
> The peer delete logic in ath11k_mac_op_unassign_vif_chanctx() is
> introduced by commit b4a0f54156ac ("ath11k: move peer delete after
> vdev stop of station for QCA6390 and WCN6855") to fix firmware
> crash issue caused by unexpected vdev stop/peer delete sequence.
>
> Actually for a STA interface peer should be deleted in
> ath11k_mac_op_sta_state() when STA's state changes from
> IEEE80211_STA_NONE to IEEE80211_STA_NOTEXIST, which also coincides
> with current peer creation design that peer is created during
> IEEE80211_STA_NOTEXIST -> IEEE80211_STA_NONE transition. So move
> peer delete back to ath11k_mac_op_sta_state(), also stop vdev before
> deleting peer to fix the firmware crash issue mentioned there. In
> this way the connection failure mentioned here is also fixed.
>
> Also do some cleanups in patch "wifi: ath11k: remove invalid peer
> create logic", and refactor in patches "wifi: ath11k: rename
> ath11k_start_vdev_delay()" and "wifi: ath11k: avoid forward declaration
> of ath11k_mac_start_vdev_delay()".
>
> Tested this patch set using QCA6390 and WCN6855 on both STA and SAP
> interfaces. Basic connection and ping work well.

I wanted to let you know I'm seeing similar behavior in my own testing, 
with these patches applied. Granted I've hacked things up quite a bit 
but it appears to happen after a firmware crash. It may be related to my 
own changes of course, but I've connected and created/started a monitor 
vdev, then wait. At some point the firmware crashes likely due to my 
botched patches, but once it starts up again I see this same timeout 
behavior before a retry which connects successfully.

> Baochen Qiang (4):
>    wifi: ath11k: remove invalid peer create logic
>    wifi: ath11k: rename ath11k_start_vdev_delay()
>    wifi: ath11k: avoid forward declaration of
>      ath11k_mac_start_vdev_delay()
>    wifi: ath11k: fix connection failure due to unexpected peer delete
>
>   drivers/net/wireless/ath/ath11k/mac.c | 564 +++++++++++++-------------
>   1 file changed, 288 insertions(+), 276 deletions(-)
>
>
> base-commit: 8ff464a183f92836d7fd99edceef50a89d8ea797

