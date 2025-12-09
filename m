Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1B9D3B98A
	for <ath11k@archiver.kernel.org>; Tue,  9 Dec 2025 18:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1+t157k9EcX922ykCgLa1miZWebr+tPv+AnHYvwjvM=; b=Fn3UmPPLlAoRzXYaAWaOlKW0Rl
	CsWvKtKd2W+kouoJrGTOPlV7eady/T/7c8Sk61UGK4rqfwaNoLoK5FhsOqRRKrH+wGIsa6RB+wvNB
	lVAx6jL6CpVty/K9iJ9xIhX9GLPZlqTkpHaOsQKCeH2+vCTL1gA5rxuzcVnkv8zQCQ7Iv0fas4QWL
	jqDvJSGhwg1lISToO5zAs5vOGBNdtJrN1lSuPWDIadY550ncnZIK7tzluALJtwb8tG4PLRVLfz4vz
	XRWjvi0PV3wsqR+q8RhFLP/GVbsgXHOeuvk8p5vbf9+YOr9yDlswefXOv3M+g25jnRJwVEyvk0Ywn
	YXNdF5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT2ZM-0000000Ef74-3T3F;
	Tue, 09 Dec 2025 18:36:16 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT2ZJ-0000000Ef6c-3vHf
	for ath11k@lists.infradead.org;
	Tue, 09 Dec 2025 18:36:16 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b77030ffad9so879082566b.0
        for <ath11k@lists.infradead.org>; Tue, 09 Dec 2025 10:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765305372; x=1765910172; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1+t157k9EcX922ykCgLa1miZWebr+tPv+AnHYvwjvM=;
        b=YkcgAwBiIeqjgIfpIXcgHhlWGgmD1QnuzB/g0tcSXS4Zu8fJFElqIgXs12Eg8DlkEW
         /xZpGkJVsScfPS6Outmr5G7rSjAH8xpXvYBSXQEiV66dsrVwqxSvsBb4adnIo53qK/xw
         aXUYZYA0IuilIihbAQ0pUmoyaQnpq7hX5HrWuQw5Vu6Ga3k1/e7L89NCiKNjOZ6/XdKE
         J2cVwsVukf5fgxwV91wkod54MaIDZo1jsbUr1PYywYkSwgJoa4fPfwcuKVCnAS72OxtA
         2qwYvT++zEAx+BzDX7W2IqvLuVb3//3ZuyHdo4dOSr78d4DxdSY4eve0ltbnAxpZLVCB
         eegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765305372; x=1765910172;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p1+t157k9EcX922ykCgLa1miZWebr+tPv+AnHYvwjvM=;
        b=p013mjen/6yD0ykASNJVSogWHAAiahj8CWqWRj1SzGR49orBzYd27RrgaI+HGgrKGq
         EiHUfPVtdGstHUnzT38MH4DPzgADr1hj77CEFqIWRMKD+1gyJlrqkHaHr38kmseNv3HN
         H8onMLKf+aUWeWuOuwst306nvUW5FqscljbTreQnSqgjUwnIebSyaaYPnE32BtDsWXKb
         UoMvh3/LFIjY9wDH2viuD6X0MYhXWqtyIiY0//SKf682KH9NxGiJwGtFFB3t3Ngb/oN7
         74/16nZ2AYCA8354NmRBLSJ0ag3KXsgFtyKbyENCuYaCPS7ng1tdIeiUT6JDn8qGuR/q
         4pGQ==
X-Gm-Message-State: AOJu0YxtwsXFFt74vBmJb7dESKKJvc2wodQ9t0wb53UurHK0TEtPXopl
	ylgLM/YnG5lJjDzR8RMJ5zW6oTRAGegE5tPfECHnG6Ih5xjL/YdPd2TfPCfVFJ3fLTK58/Rwrxt
	4QL1lT2hDLnlWBjoeuXHnbmMfDF8O1s6FEl6D
X-Gm-Gg: ASbGncuTige7ne8sm6JPqKDm8XWMvE2V/2lNmhP3nywST6ZOs0hI/2jWgRxJegNMXa5
	3W3toQTUz3gVrCca6loXtS5G7DdgMjLCttb3OgZTqtk39gbkO8FMrCvEOeE+CRBCG9mpRs4MA/J
	cyTtFP4OftOTvDHIkWcPD7lt1jBDhZmGnmMUkHm32yG8yp0OFjwHktL+rReKa08O9Zdlaq6AzEt
	FfVxxOa5tgVCfdOjLHqISbQQYphZQ2Fc5LLmWcnVSL2779LWDiiGNerPGWNdK2tBIrTuX2AgGGO
	kQDyifqvZxjNzmtD6WGffF8DSmD8
X-Google-Smtp-Source: AGHT+IHd/xvW8UggQFBNsAdo+mQmLE/xjncONHk16aGjpZXuNcapZjtC8iqEyVWtRr2CRZMDegQJIkthbQIj7kHxCAc=
X-Received: by 2002:a17:907:7291:b0:b72:eaba:aac2 with SMTP id
 a640c23a62f3a-b7a24304344mr1297907866b.26.1765305371651; Tue, 09 Dec 2025
 10:36:11 -0800 (PST)
MIME-Version: 1.0
References: <CAPEqGQoo7Cw7qBZYtvTqGr30mi+s0OXL5KgUSnWh2sjEutKw-w@mail.gmail.com>
In-Reply-To: <CAPEqGQoo7Cw7qBZYtvTqGr30mi+s0OXL5KgUSnWh2sjEutKw-w@mail.gmail.com>
From: Aliliche Larbi <alilichelarbi@gmail.com>
Date: Tue, 9 Dec 2025 19:36:00 +0100
X-Gm-Features: AQt7F2rW_HiR1ocoeVUJSg94ljLyw0AGZ8tJskcUTdBArnC0DdQkka2rM3ScdUs
Message-ID: <CAPEqGQo=mQ23uP-+y+eMYraTpjx2iHxBpgkXpTC8P4kgfeWUTA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5Bath11k=5D_Roaming_latency_with_Compex_WLE300HX_=28Q?=
	=?UTF-8?Q?CN9074=29_=E2=80=94_firmware=2Fdriver_issue=2FLatency?=
To: ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_103614_638597_FE2C5966 
X-CRM114-Status: GOOD (  13.90  )
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

Hello,

I noticed an error in my previous message regarding roaming latency
measurements sent : Tue Dec 9 10:25:01 PST 2025. Please see the
corrected information below.

The radio card is : Compex WLE3000HX

larbi.

Le mar. 9 d=C3=A9c. 2025 =C3=A0 19:25, Aliliche Larbi <alilichelarbi@gmail.=
com> a =C3=A9crit :
>
> Hello,
>
> I am experiencing persistent roaming latency with a Compex WLE300HX
> (QCN9074-based) Wi-Fi 6 PCIe card using the ath11k driver.
>
> I have a roaming test platform with multiple APs and controllable
> attenuators.
>
> The roaming test is performed between two 11a access points:
> - AP1 on channel 36
> - AP2 on channel 149
>
> Using Wireshark monitors, I measured the time between:
> 1) the last data packet on channel 36, and
> 2) the first data packet on channel 149.
>
> I tested four devices:
>
> 1. ACKSYS Railbox (WLE300HX), firmware QCN9074:
>    https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware.git
>
> 2. 8devices Mango kit, CPU IPQ6018 + WLE300HX (QCN9074 firmware)
>
> 3. ACKSYS Airwave, CPU IPQ6018 + QCA firmware:
>    https://github.com/andreybondar59/firmware_qca-wireless
>
> 4. Moxa AWK-1161C, CPU IPQ6010, firmware unknown
>
> Roaming time (last data packet on ch36 =E2=86=92 first data packet on ch1=
49):
> - Moxa: ~104 ms
> - Railbox: ~180 ms
> - AirWave: ~104 ms
> - Mango: ~140 ms
>
> Wireshark measurement (last data packet ch36 =E2=86=92 authentication res=
ponse ch149):
> - Moxa: ~44 ms
> - Railbox: ~101 ms
> - AirWave: ~51 ms
> - Mango: ~100 ms
>
> I traced the Railbox using ftrace and extracted several WMI commands and
> their response times, from the last data packet on channel 36 until
> authentication success on channel 149:
>
> subif_start_xmit -> wmi_install_key_cmdid: 19.9 ms
> wmi_install_key_cmdid -> wmi_install_key_cmdid_response: 1.2 ms
> wmi_install_key_cmdid_response -> wmi_perr_delete_cmdid: 0.26 ms
> wmi_perr_delete_cmdid -> wmi_perr_delete_cmdid_response: 5 ms
> wmi_perr_delete_cmdid_response -> ath11k_mac_vdev_stop(): 0.5 ms
> ath11k_mac_vdev_stop() -> wmi_vdev_stop_cmdid: 19.3 ms
> wmi_vdev_stop_cmdid -> wmi_vdev_stop_cmdid_response: 0.27 ms
> wmi_vdev_stop_cmdid_response -> ath11k_wmi_vdev_start(): 0.03 ms
> ath11k_wmi_vdev_start() -> wmi_vdev_start_cmdid: 6.3 ms
> wmi_vdev_start_cmdid -> wmi_vdev_start_cmdid_response: 38.7 ms
> wmi_vdev_start_cmdid_response -> ieee80211_mgd_auth: 18.7 ms
> ieee80211_mgd_auth -> wmi_send_auth_req_cmdid: 5 ms
> wmi_send_auth_req_cmdid -> wmi_send_auth_req_cmdid_completed: 2.7 ms
> wmi_send_auth_req_cmdid_completed -> wmi_rx_auth_response: 1.39 ms
> wmi_rx_auth_response -> ieee80211_mark_sta_authenticated(): 3.57 ms
>
> Total: ~123 ms between the last packet on ch36 and authentication
> success on ch149
>
> Note: These timings are specific to the Railbox (QCN9074).
> The Airwave (IPQ6018 + QCA firmware) behaves differently; for instance,
> the vdev start command responds in ~10 ms on the Airwave firmware.
>
> Given this, it seems the QCN9074 firmware responds significantly slower.
>
> What are the differences between the WLE300HX QCN9074 firmware and the
> QCA firmware used on the Airwave device? Is there anything that can be
> tuned or configured to reduce roaming latency?
>
>
> Thank you,
> Larbi
> ------------------------------------------------------wireshark
> measures in ms--------------------------------------------------
> Event                         | MOXA         | RailboxV2 + WLE3000HX
>   |AirWave (New FW)     | Mango + WLE3000HX
> --------------------------+-------------------+--------------------------=
------------+-----------------------------+-------------------
> LAST DATA PACKET    | T0                | T0
>                 | T0                       | T0
>
> Disassociate                  | T0+{16}       | XX
>                       | Deauth XX          | XX
> Auth request                  | T0+{42}       | T0+{94;97}
>                   | T0+{48}               | T0+{96}
> Auth response               | T0+{44}       | T0+{98;101}
>                | T0+{51}               | T0+{99}
> Assoc request                | T0+{46}      | T0+{113;116}
>               | T0+{57}               | T0+{104}
> Assoc response             | T0+{51}      | T0+{115;118}
>             | T0+{58}               | T0+{106}
> EAPOL 1/4                    | T0+{61}       | T0+{123;126}
>                | T0+{67}               | T0+{113}
> EAPOL 2/4                    | T0+{64}      | T0+{142;144}
>                | T0+{73}               | T0+{124}
> EAPOL 3/4                    | T0+{67}      | T0+{145;147}
>                | T0+{76}               | T0+{125}
> EAPOL 4/4                    | T0+{68}      | T0+{148;151}
>                | T0+{78}               | T0+{129}
>
> LAST DATA PACKET    | T0+{104}    | T0+{177;197}
>      | T0+{104}             | T0+{140}

