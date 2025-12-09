Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FCED3B98D
	for <ath11k@archiver.kernel.org>; Tue,  9 Dec 2025 18:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lkc4Nd76roOagE/sydZDRrKk4ou7BRA6VRWLgxtS9gw=; b=Rb3wpSZaez12sA9fAe3BXpVa6t
	Pi40kzlmVUcwAxOc45s9KkgJZRobuPrAKRjhBlc/yiaFK7TeOxUjedfbqD3ueYlgu77BNZASo3JVs
	/RRsaJHa0J1CsL+BVBdudGwyoR6hjt4blZoO/4VSo4lCiDYyID5+VacDn/gT8dIn/bJofnkO1Mcm5
	RYZGyIJWyYUrVM4eyMr4xdOwU2QbXhMzARWyTDzTE9B01L6Q0yTPXWVFZbnAWBnWeM1bvARq2mV0d
	S+LmJj9/TZzNTozFXbhwfO2oBKljjXT5WdHP/OSNBkG7ejlgk863cT64wIHVj4Ml8I9D49f4z0uRl
	n1/uqFHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT2Op-0000000EeYq-06np;
	Tue, 09 Dec 2025 18:25:23 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT2Ok-0000000EeXQ-0mvM
	for ath11k@lists.infradead.org;
	Tue, 09 Dec 2025 18:25:21 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-64175dfc338so10220940a12.0
        for <ath11k@lists.infradead.org>; Tue, 09 Dec 2025 10:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765304714; x=1765909514; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lkc4Nd76roOagE/sydZDRrKk4ou7BRA6VRWLgxtS9gw=;
        b=QV1o2LxQoi4YRZNxYkn/OveT+BhTxKtBZZl5P6LURJMd7aAy6DdVTMWXxI+yv0vzYm
         RsMbrjgRAyntPkfUWPnUF+KsFiew3u9gWtQjJ4bloW5nMKTos+DtvcLudBKOJDISeEDX
         DP6qh7/OlAnOLT8gT2l4gF+uQMVLwfIyyH6rDtX+GvnQPdXZVRtMykKqf/Ye0sMX7Og0
         fEkhSTnvUOxkl1ZF9POgjzzVbuS+3y64kpiFpANViFjv4x3Igh+zcV3POrfKANr6MnyL
         QNdjPSJv2PUETMqVjboMzj+RSJOxv+FlEtMu2vmfSE5quGzwi/07Ay7Jr64IKQFm0FRc
         li0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765304714; x=1765909514;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkc4Nd76roOagE/sydZDRrKk4ou7BRA6VRWLgxtS9gw=;
        b=GcpNtI3N0pobmRr5wCHnYxqP1yIUN02SlLEoFzjb1jOGVZkMhXQFa1gBDKXmAytWM1
         jgY8KIkMnzBxbALmmcFgYjZeyZl+3uu1dRx/4i8cfPIM9C0RzpF+q7zciEsDLkuLMPyL
         OLuX0P2l7z5lDNYhUfNZmedkObQtfFYEfK/ebgey84acxSenIWXgu7tT1QdgLm2CPI7/
         OqeJVIy8Zpq+ShLvuXgAHuhmDyhjxF1zZYZhGJoNBC/u7/hjt2ZIuIKe5TsmVinRQ46G
         3vH1JXlUs15FmJMApoy6TMSB99Bfc4PevJWip3H3HHbwK1cXCTD3xu4RZdeKJmWkCiop
         ISaQ==
X-Gm-Message-State: AOJu0YxVJQZ/mSz2iAZXgjT/ixdOGJyuHbhMRLatPg16BqkuCbrb9RlN
	Rrv2r7atBxuk+wRpAR2+/NLtPFxV3h4iluJ8JArP4RdxSpMOV1+OVFYfl4jk6D3wPplpKJ/wR7n
	ihoIP2/ZlQTwg0bV4s7vPZBgQS3pwYkDZm//Z
X-Gm-Gg: ASbGncuZuVZbzdTQqjntpZ0Ho4y90HBRBWvjyKKufnTMNVx+oMChyd0CWbUtfvKoUZd
	bDcdHk4u/F1K4TcA0PWUx+J5qHKDZOXrpRf1A2nzVnynvqLdAwpwic+TCPMD+74hBgKb6GGiZJ8
	BzIjM72puNt2jSuqxw/j4uSzEqRL5/qeD0DvIKTCN7M+MTn4j77VWCNx00WgRYxhwNEmPuRBkNx
	9yqH/MmeRtmBbekKRZ8JHLxyHKeZm9ThlSn4JFMDjEJwBOwaTs14+ziyHW9hkbRDsL8wvbjWAMM
	mmwKfbUaI7LUV94Mc3DVkJ85/gH/
X-Google-Smtp-Source: AGHT+IE8cF2ROt4BH9y56/oqoQcJtiGa6j4xYX1COcGKP4iQ21POcvUVW+o/iPagJ0QZ10VvAO1L7m7uKIkC/PY2w+I=
X-Received: by 2002:a05:6402:1465:b0:640:c8b8:d55 with SMTP id
 4fb4d7f45d1cf-64919c0dfb8mr10612218a12.3.1765304713612; Tue, 09 Dec 2025
 10:25:13 -0800 (PST)
MIME-Version: 1.0
From: Aliliche Larbi <alilichelarbi@gmail.com>
Date: Tue, 9 Dec 2025 19:25:01 +0100
X-Gm-Features: AQt7F2qZyCMFWTFgcbJPIwyUC8pDF0SQUCADWilEfddl0Lq4EkZ9izmEp2ZpoMY
Message-ID: <CAPEqGQoo7Cw7qBZYtvTqGr30mi+s0OXL5KgUSnWh2sjEutKw-w@mail.gmail.com>
Subject: =?UTF-8?Q?=5Bath11k=5D_Roaming_latency_with_Compex_WLE300HX_=28QCN90?=
	=?UTF-8?Q?74=29_=E2=80=94_firmware=2Fdriver_issue=2FLatency?=
To: ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_102518_242590_0CE78044 
X-CRM114-Status: UNSURE (   4.92  )
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

Hello,

I am experiencing persistent roaming latency with a Compex WLE300HX
(QCN9074-based) Wi-Fi 6 PCIe card using the ath11k driver.

I have a roaming test platform with multiple APs and controllable
attenuators.

The roaming test is performed between two 11a access points:
- AP1 on channel 36
- AP2 on channel 149

Using Wireshark monitors, I measured the time between:
1) the last data packet on channel 36, and
2) the first data packet on channel 149.

I tested four devices:

1. ACKSYS Railbox (WLE300HX), firmware QCN9074:
   https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware.git

2. 8devices Mango kit, CPU IPQ6018 + WLE300HX (QCN9074 firmware)

3. ACKSYS Airwave, CPU IPQ6018 + QCA firmware:
   https://github.com/andreybondar59/firmware_qca-wireless

4. Moxa AWK-1161C, CPU IPQ6010, firmware unknown

Roaming time (last data packet on ch36 =E2=86=92 first data packet on ch149=
):
- Moxa: ~104 ms
- Railbox: ~180 ms
- AirWave: ~104 ms
- Mango: ~140 ms

Wireshark measurement (last data packet ch36 =E2=86=92 authentication respo=
nse ch149):
- Moxa: ~44 ms
- Railbox: ~101 ms
- AirWave: ~51 ms
- Mango: ~100 ms

I traced the Railbox using ftrace and extracted several WMI commands and
their response times, from the last data packet on channel 36 until
authentication success on channel 149:

subif_start_xmit -> wmi_install_key_cmdid: 19.9 ms
wmi_install_key_cmdid -> wmi_install_key_cmdid_response: 1.2 ms
wmi_install_key_cmdid_response -> wmi_perr_delete_cmdid: 0.26 ms
wmi_perr_delete_cmdid -> wmi_perr_delete_cmdid_response: 5 ms
wmi_perr_delete_cmdid_response -> ath11k_mac_vdev_stop(): 0.5 ms
ath11k_mac_vdev_stop() -> wmi_vdev_stop_cmdid: 19.3 ms
wmi_vdev_stop_cmdid -> wmi_vdev_stop_cmdid_response: 0.27 ms
wmi_vdev_stop_cmdid_response -> ath11k_wmi_vdev_start(): 0.03 ms
ath11k_wmi_vdev_start() -> wmi_vdev_start_cmdid: 6.3 ms
wmi_vdev_start_cmdid -> wmi_vdev_start_cmdid_response: 38.7 ms
wmi_vdev_start_cmdid_response -> ieee80211_mgd_auth: 18.7 ms
ieee80211_mgd_auth -> wmi_send_auth_req_cmdid: 5 ms
wmi_send_auth_req_cmdid -> wmi_send_auth_req_cmdid_completed: 2.7 ms
wmi_send_auth_req_cmdid_completed -> wmi_rx_auth_response: 1.39 ms
wmi_rx_auth_response -> ieee80211_mark_sta_authenticated(): 3.57 ms

Total: ~123 ms between the last packet on ch36 and authentication
success on ch149

Note: These timings are specific to the Railbox (QCN9074).
The Airwave (IPQ6018 + QCA firmware) behaves differently; for instance,
the vdev start command responds in ~10 ms on the Airwave firmware.

Given this, it seems the QCN9074 firmware responds significantly slower.

What are the differences between the WLE300HX QCN9074 firmware and the
QCA firmware used on the Airwave device? Is there anything that can be
tuned or configured to reduce roaming latency?


Thank you,
Larbi
------------------------------------------------------wireshark
measures in ms--------------------------------------------------
Event                         | MOXA         | RailboxV2 + WLE3000HX
  |AirWave (New FW)     | Mango + WLE3000HX
--------------------------+-------------------+----------------------------=
----------+-----------------------------+-------------------
LAST DATA PACKET    | T0                | T0
                | T0                       | T0

Disassociate                  | T0+{16}       | XX
                      | Deauth XX          | XX
Auth request                  | T0+{42}       | T0+{94;97}
                  | T0+{48}               | T0+{96}
Auth response               | T0+{44}       | T0+{98;101}
               | T0+{51}               | T0+{99}
Assoc request                | T0+{46}      | T0+{113;116}
              | T0+{57}               | T0+{104}
Assoc response             | T0+{51}      | T0+{115;118}
            | T0+{58}               | T0+{106}
EAPOL 1/4                    | T0+{61}       | T0+{123;126}
               | T0+{67}               | T0+{113}
EAPOL 2/4                    | T0+{64}      | T0+{142;144}
               | T0+{73}               | T0+{124}
EAPOL 3/4                    | T0+{67}      | T0+{145;147}
               | T0+{76}               | T0+{125}
EAPOL 4/4                    | T0+{68}      | T0+{148;151}
               | T0+{78}               | T0+{129}

LAST DATA PACKET    | T0+{104}    | T0+{177;197}
     | T0+{104}             | T0+{140}

