Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDFEC282D1
	for <ath11k@archiver.kernel.org>; Mon,  3 Mar 2025 15:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWIXuPc4m1eeN4AwHgo8V/KdIHX8Pn3/CGz7RPYywtw=; b=WKeuRg84llRpSAyTkUxSsdYyE7
	qn1KaZAZLWMXyCHxMeFDi/Cpwo69KXJv+/B72046hhUJqUFpFfNaALaNifwVpZMYBY7lRuo2zxoll
	0wEMaCzTQMBDsoT8LdEdtgpojjhOLK3Y2XT+hnTYO5SxArzpDQSdaabVIUfOPQvyRFXbAhd3hX6AJ
	KsTDCrWLpA0qhublPFmZ/MBTpi+QzgIgZbNj1tUKaa3TJxRCmfWAJ6zqsAwDH5yif4zlhNG95nhzs
	YrA3DOQVLCHTcWp5nWaAHdw20FX/rWn0jZsTY2KsAZ1me+rhYwXJhnLFMk8g8/ScnfOgLr8RYjctM
	o5qDG5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7Zm-00000001Gzm-3c97;
	Mon, 03 Mar 2025 15:19:26 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7Zk-00000001Gyg-1ooX;
	Mon, 03 Mar 2025 15:19:25 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22359001f1aso101877285ad.3;
        Mon, 03 Mar 2025 07:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015163; x=1741619963; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NWIXuPc4m1eeN4AwHgo8V/KdIHX8Pn3/CGz7RPYywtw=;
        b=DzJZKfoQALHttC7xRSng5TGsRRt7tFSJLvouHSaUGVu5+IgAzIIIrCTjcSag8F0vof
         rPi+KIT0RH7xHz2jIn8WEStmkZhvkmc8QI4OvUNikKZ6xBbTOhU2tMjr6suWvIJw4dTl
         4U6Y5/XkVA4m6JLiTYlUqKlOG+uB2uBah3/de1itgXd0TMULu1SmQiXm/p8lTkQYO892
         QwhlOUMtmHcugMtC/PuXK8p9rplLxVXDl7gBTsqdztGzzrBhcYO9HDtAWz3XB/SdOfzK
         5NC6AvsqWzJcDH/1vM3dXbHNw42SpcFoiUI5AqMm2WEkyRbt2VPRNwHRNvkr5r39bLue
         kZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015163; x=1741619963;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NWIXuPc4m1eeN4AwHgo8V/KdIHX8Pn3/CGz7RPYywtw=;
        b=npKGsK3bqSmIJrtBCuzNGgSOIO3z9rRWjsd34QJT9IPatIgEs8JA33fB0V6nABxSSt
         4qoX5LgHmUp00LyeU+OuVHqjUQJtFFRztiRSiY6O3OxOHBdCKbqelqClxPOYia6lf6QC
         qfJrHTWClPOuuFxTQ/9RdGHSXTuGrPtuTGvG8Zv3U/f2NjJqBtaD63wCLBjh4vjFa42S
         B+EKUQrxSwAyRO1wC07i2iJiNWqIA/J/x1oIqGKgCgeOuQAGROOPGTUuzW3LAcp7lB6s
         XWVca/vH2bIAlpjTYas4UCuuFSlcny1PUyhTBPhP3XdfVRtYlVHm89OrOUmHcaRw/vYM
         WjlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg5tCQthlJQME8Y1AyF5PJhcc+XVdr4KQgDfOPUopnHZPddsTvXeM6bvTbkh8+4QoiAMq6pfY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyUlR/81pxVy739/9CVQC6FsWWo1hiyhpmCsANw9IaxZsywGbB
	mEpy2ctP5Zpimf7L0q7L+8rd8FAllzgbAB1Xdf4+qcNLpg7A/pZk+amhHg==
X-Gm-Gg: ASbGncsM13jN08PWFSWDZJd2AT4TK2688/OWoOqVRlEX5xmncASWiMf2Fp117Lhba8C
	5ctF0BhcPTPn1aYxo2+0yQ3HKRnjQ6Gl91YgAS3IDOxtWYwW2N6k9qIc6PrHd/qSjjHxluOHWAQ
	Tai9pQ93zU5MEbJkwc+c/cQ82mvcaPKw4f2Y2ixw6xYFQer4HG1lcsgeBcLXTlEpqgwj06qsY5s
	DoUtiq1mSYmYaqpgQHfFRc3QJUH73w5Tu2Ih93Z0Y2Qz1JZVbAM1OCzRE7/1pZ0EcV94MZKDyic
	y/YP5aOXZJENLFpYmhrWvHE1I+o46sKaedgO2ScVronCi0kT
X-Google-Smtp-Source: AGHT+IElZ7MSRul6VnOUi3YIAcx+W0OWu4AJQ8VE2nVgWZeXyyB6RkpCRTVGIzMizYQwknZJO3BWwg==
X-Received: by 2002:a05:6a00:ad0:b0:72d:9cbc:730d with SMTP id d2e1a72fcca58-734ac36d76dmr22319128b3a.11.1741015162760;
        Mon, 03 Mar 2025 07:19:22 -0800 (PST)
Received: from [10.100.120.127] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736512c5694sm2594945b3a.179.2025.03.03.07.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 07:19:22 -0800 (PST)
Message-ID: <62a3f906-d16d-42ed-9a72-aaeb81499098@gmail.com>
Date: Mon, 3 Mar 2025 07:19:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Connection timeouts (NL80211_TIMEOUT_UNSPECIFIED) after
 disconnect/association timeout
From: James Prestwood <prestwoj@gmail.com>
To: "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>
Cc: ath10k@lists.infradead.org,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <441e9883-1efc-498b-ba33-6a4f12443f3b@gmail.com>
Content-Language: en-US
In-Reply-To: <441e9883-1efc-498b-ba33-6a4f12443f3b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_071924_483743_C6B5E60F 
X-CRM114-Status: GOOD (  29.06  )
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

Still seeing this, and I think I've uncovered a bit more info. I'm going 
to add some additional debugging to confirm, but it appears for some 
reason the kernel's BSS list does not contain the BSS (or in some cases 
any BSS's) we are trying to connect to. I'll go over the sequence of 
events again:

1. Client gets deauthenticated for whatever reason

Feb 27 22:43:58 kernel: wlan0: deauthenticated from **:**:**:22:60:7c 
(Reason: 6=CLASS2_FRAME_FROM_NONAUTH_STA)

2. Client issues a scan to reconnect, note that it clearly sees the 
following BSS's after scanning:

Feb 27 22:43:58 iwd[457]: src/station.c:station_print_scan_bss() 
Processing BSS '**:**:**:22:40:92' with SSID: <redacted>, freq: 5300, 
rank: 1702, strength: -5900, data_rate: 173.3, snr: 40, load: 21/255
Feb 27 22:43:58 iwd[457]: src/station.c:station_print_scan_bss() 
Processing BSS '**:**:**:1c:10:98' with SSID: <redacted>, freq: 5500, 
rank: 1418, strength: -6300, data_rate: 144.4, snr: 33, load: 37/255

3. Client tries to connect to **:**:**:22:40:92

Feb 27 22:43:58 iwd[457]: event: connect-info, ssid: <redacted>, bss: 
**:**:**:22:40:92, signal: -59, load: 21/255
Feb 27 22:43:58 iwd[457]: event: state, old: autoconnect_quick, new: 
connecting (auto)

4. Based on the IWD logging it appears the kernel has no BSS record, and 
tries to issue a scan (the scan was definitely not from IWD), but 
apparently comes up with nothing:

Feb 27 22:43:58 iwd[457]: src/scan.c:scan_notify() Scan notification 
Trigger Scan(33)
Feb 27 22:43:59 iwd[457]: src/scan.c:scan_notify() Scan notification New 
Scan Results(34)
Feb 27 22:43:59 iwd[457]: src/netdev.c:netdev_mlme_notify() MLME 
notification Connect(46)
Feb 27 22:43:59 iwd[457]: src/netdev.c:netdev_connect_event()
Feb 27 22:43:59 iwd[457]: src/netdev.c:netdev_connect_event() aborting 
and ignore_connect_event not set, proceed
Feb 27 22:43:59 iwd[457]: event: connect-timeout, reason: 0

The timeout reason 0 is NL80211_TIMEOUT_UNSPECIFIED.

5. IWD proceeds to the next BSS, which the kernel also needs to scan 
for, but succeeds:

Feb 27 22:43:59 iwd[457]: event: connect-info, ssid: <redacted>, 
bss: **:**:**:1c:10:98, signal: -63, load: 37/255
Feb 27 22:43:59 iwd[457]: src/station.c:station_try_next_bss() 
Attempting to connect to next BSS **:**:**:1c:10:98
Feb 27 22:43:59 iwd[457]: src/netdev.c:netdev_link_notify() event 16 on 
ifindex 5
Feb 27 22:43:59 iwd[457]: src/scan.c:scan_notify() Scan notification 
Trigger Scan(33)
Feb 27 22:43:59 iwd[457]: src/scan.c:scan_notify() Scan notification New 
Scan Results(34)
Feb 27 22:43:59 iwd[457]: src/netdev.c:netdev_link_notify() event 16 on 
ifindex 5
Feb 27 22:43:59 iwd[457]: src/netdev.c:netdev_mlme_notify() MLME 
notification New Station(19)
Feb 27 22:43:59 kernel: wlan0: authenticate with **:**:**:1c:10:98 
(local address=**:**:**:a2:a4:58)
Feb 27 22:43:59 kernel: wlan0: send auth to **:**:**:1c:10:98 (try 1/3)

So it would appear to me that despite the original scan that IWD issued 
which clearly showed both BSS's the kernel's BSS list did not contain 
those entries. In both cases above the kernel needed to scan for the 
requested BSS. Anything we can do on the supplicant side? I figured an 
explicit scan by the supplicant would surely populate the kernel's BSS 
list, but apparently in some cases it does not?

Thanks,

James

On 12/4/24 8:57 AM, James Prestwood wrote:
> Hi,
>
> I noticed this behavior where in some cases if the client gets 
> disconnect or fails to roam due to an association timeout the next 
> connection attempt will fail with a timeout of 
> NL80211_TIMEOUT_UNSPECIFIED as the reason. Briefly looking at the 
> kernel code in nl80211/sme.c:cfg80211_conn_do_work() this appears to 
> be the default value passed in, so its hitting one of the cases that 
> aren't auth/assoc related. There are no kernel logs when this happens. 
> The supplicant fails multiple times continuing to iterate BSS's until 
> it finally is able to connect a few seconds later. In some _very_ rare 
> cases I have seen the client never able to reconnect to any BSS's, it 
> just loops over all BSS with the same NL80211_TIMEOUT_UNSPECIFIED 
> error indefinitely until a customer notices and reboots the client.
>
> I see this behavior on kernel 6.2 and 6.8 (that's all our clients run 
> at the moment) and on both ath10k and ath11k drivers. I'm not able to 
> get this to happen with mac80211_hwsim fwiw. Prior to switching to 6.2 
> (and 6.8) we were on 5.15 and I never saw this happen.
>
> Below are some logs from the kernel and IWD. Lots of irrelevant lines 
> have been removed to be more concise.
>
> tl;dr
>
> 1. Got an association timeout attempting to roam, disconnected
>
> 2. Scanned (~1 second), plenty of available BSS's
>
> 3. Failed to connect to 4 different BSS's in a row with 
> NL80211_TIMEOUT_UNSPECIFIED ("reason: 0")
>
> 4. Failed to connect to the next BSS with an auth timeout (no issue 
> here, this just happens sometimes)
>
> 5. Finally able to connect to another BSS (oddly, the original BSS we 
> were roaming away from)
>
>
> Dec 04 11:42:34 iwd[391]: event: roam-info, bss: **:**:**:13:06:ea, 
> signal: -87, load: 63/255
> Dec 04 11:42:34 iwd[391]: event: state, old: connected, new: ft-roaming
> Dec 04 11:42:34 kernel: wlan0: disconnect from AP **:**:**:13:07:b6 
> for new assoc to **:**:**:13:06:ea
> Dec 04 11:42:34 kernel: wlan0: associate with **:**:**:13:06:ea (try 1/3)
> Dec 04 11:42:34 kernel: wlan0: associate with **:**:**:13:06:ea (try 2/3)
> Dec 04 11:42:34 kernel: wlan0: associate with **:**:**:13:06:ea (try 3/3)
> Dec 04 11:42:34 kernel: wlan0: association with **:**:**:13:06:ea 
> timed out
> Dec 04 11:42:34 iwd[391]: src/netdev.c:netdev_associate_event()
> Dec 04 11:42:34 iwd[391]: event: association-timeout,
> Dec 04 11:42:34 iwd[391]: event: state, old: ft-roaming, new: 
> disconnected
> Dec 04 11:42:34 iwd[391]: event: state, old: disconnected, new: 
> autoconnect_quick
> Dec 04 11:42:34 iwd[391]: src/station.c:station_quick_scan_triggered() 
> Quick scan triggered for wlan0
> Dec 04 11:42:35 iwd[391]: src/scan.c:scan_notify() Scan notification 
> New Scan Results(34)
> Dec 04 11:42:35 iwd[391]: src/netdev.c:netdev_link_notify() event 16 
> on ifindex 5
> Dec 04 11:42:35 iwd[391]: event: connect-info, ssid: <redacted>, bss: 
> **:**:**:12:fc:f8, signal: -56, load: 65/255
> Dec 04 11:42:35 iwd[391]: event: state, old: autoconnect_quick, new: 
> connecting (auto)
> Dec 04 11:42:35 iwd[391]: event: connect-timeout, reason: 0
> Dec 04 11:42:35 iwd[391]: event: connect-info, ssid: <redacted>, bss: 
> **:**:**:12:fd:56, signal: -62, load: 69/255
> Dec 04 11:42:36 iwd[391]: event: connect-timeout, reason: 0
> Dec 04 11:42:36 iwd[391]: event: connect-info, ssid: <redacted>, bss: 
> **:**:**:13:08:33, signal: -60, load: 53/255
> Dec 04 11:42:36 iwd[391]: event: connect-timeout, reason: 0
> Dec 04 11:42:36 iwd[391]: event: connect-info, ssid: <redacted>, bss: 
> **:**:**:12:fd:34, signal: -67, load: 43/255
> Dec 04 11:42:36 iwd[391]: event: connect-timeout, reason: 0
> Dec 04 11:42:36 kernel: wlan0: authenticate with **:**:**:13:07:b6
> Dec 04 11:42:36 iwd[391]: event: connect-failed, status: 1
> Dec 04 11:42:36 iwd[391]: event: connect-info, ssid: <redacted>, bss: 
> **:**:**:13:07:b6, signal: -70, load: 28/255
> Dec 04 11:42:36 iwd[391]: src/station.c:station_try_next_bss() 
> Attempting to connect to next BSS **:**:**:13:07:b6
> Dec 04 11:42:36 kernel: wlan0: send auth to **:**:**:13:07:b6 (try 1/3)
> Dec 04 11:42:36 kernel: wlan0: send auth to **:**:**:13:07:b6 (try 2/3)
> Dec 04 11:42:36 kernel: wlan0: authenticated
> Dec 04 11:42:36 kernel: wlan0: associate with **:**:**:13:07:b6 (try 1/3)
> Dec 04 11:42:36 kernel: wlan0: RX AssocResp from **:**:**:13:07:b6 
> (capab=0x1511 status=0 aid=3)
>
>
> While writing this email I also saw it happen live while I had a 
> mac80211/cfg80211 trace running. In this recent case it failed on 12 
> consecutive BSS's with the unspecified timeout. That trace log is 
> attached, maybe could shed more light on this.
>
> Thanks,
>
> James

