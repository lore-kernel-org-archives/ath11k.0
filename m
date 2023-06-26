Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E994EB64DA
	for <ath11k@archiver.kernel.org>; Mon, 26 Jun 2023 12:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ezF/bO48opZwSZJ0BnmsPtUKTBLDHaT5HE1YqmSpy5U=; b=wX+WAuy27NSaeXd0c9oSu1xwqg
	BmKL1R+LYsNtNrWNBba3d0VonaY8YFVxewKzaoBy+tcgA4wU53RMgyZrrjrqeADOv3MexYYOJ2LkV
	LrbWqTxQu/zxGY9KoX6jE7XUICQO7BKYJ4/12sD9Aq7m45o3SgkYf6U20qAOO4Hg/V7OLzqufZsR5
	f3XHPUAIpL0muS3qtsbJnT5pOn6t+mR5cU49Z2cRhKxyPIPZNEe61CAMwIQekYFc63ZV3vMfWECgH
	XRhiYobgNSuZJ/gFiUh8k2aHfIHucVjj0wxGTthpCMe+VCx4aRj12wpYeyCt9WN3bLS8dEKxvwQEi
	rj5zgnew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDlJl-00ACdV-1q;
	Mon, 26 Jun 2023 12:27:41 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDlJi-00ACcu-2l
	for ath11k@lists.infradead.org;
	Mon, 26 Jun 2023 12:27:40 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51d97ba7c01so1411697a12.2
        for <ath11k@lists.infradead.org>; Mon, 26 Jun 2023 05:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squaremind-io.20221208.gappssmtp.com; s=20221208; t=1687782457; x=1690374457;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qtjRpihfmBF43v8uopj+SnOGzMPs03iR5PA/6PiBD5U=;
        b=fKQl6WfQoAnCq4NhoQ64iJ/lxyTtdDjXGNTHlq5r7HsKN8gZUGWVTFBZK2TuqCDIKS
         7wuz6dRf4NTBtagd3o+ALZdpls1KL9kzGRc2N5qEC1nvt0IrqJJr+f8/EBt2+7KQWLMt
         pmMI31RfM4+H8kzFjYGnVVKlD3B6Qz47mXAADwNaxFd8PPRBYH4qKeM9eTZo0XCGKao/
         sQ/lfaolD8603JEi8NudKkZinx3H5ZfaJBpi6oH6irCNZrQf2SE0lEilRabCXFQtca7/
         eSKItBJzslBDOJwPub/ZKcmB3731Nw8bsp2Yc0CJEgCUBlVNWB1IXalANy1ebkSAsLeT
         7OaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687782457; x=1690374457;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qtjRpihfmBF43v8uopj+SnOGzMPs03iR5PA/6PiBD5U=;
        b=BxX/3ZJky71S3y/RkC5KUCW146XRom091zt8O8c1147wyEq66k7QHv4RIObF8x/IIp
         eDfaewXjFXZIyAQ14QzSKCzoaKvU38SNKC2NGVnH2GxLqxeWxwrhOisoO7IO3Gekd+zi
         ArP9zkLYRIlBunmKL7CgXeuIeoI72fWsbYfaU9jA96zKWJS6PqB4yHR34Ow8IyResAOV
         NtU/ZU0aXswCw1wdqCU1Akf+KCBkYacekd4O2ofLWpRSawyzX0sobGNE7+vErmDaivU6
         gedKvUPGTRO+XCKbImhHc4NFccoPKJb/RIh0ID6546aW2OTWfx2A3PmrZ6Zw4JkScR+w
         DoVw==
X-Gm-Message-State: AC+VfDzA4TtY2Z9MiKeka8kF7nk/ysgKa9L2g6FGXr+XyIzipEOsUWf6
	Z098QwrTG5wDAZGFJi0DRUEdSY4smMbOkoek3FCBPcxqOwxUgc7LA6uF/Q==
X-Google-Smtp-Source: ACHHUZ4k6teu72Yeh5/7pOYAs7eYA6b1xCb4fg3EVJ5TgK5dpVK5I6nUm+AyQMQSNueDZvKGGdGmL+iXU00YNWMej4I=
X-Received: by 2002:aa7:d6d6:0:b0:51d:95f2:ee76 with SMTP id
 x22-20020aa7d6d6000000b0051d95f2ee76mr2439872edr.27.1687782455996; Mon, 26
 Jun 2023 05:27:35 -0700 (PDT)
MIME-Version: 1.0
From: Tanguy Serrat <tanguy@squaremind.io>
Date: Mon, 26 Jun 2023 14:27:25 +0200
Message-ID: <CAPr+0Hb5b_CEihVH+Mo-uR4+Wp-ACkoCySkyLrk=mkzme6ezPg@mail.gmail.com>
Subject: ath11k: QCN9074: low HE-MCS index
To: ath11k@lists.infradead.org
Content-Type: multipart/mixed; boundary="000000000000bfb95305ff0779ae"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_052738_893896_36D1F391 
X-CRM114-Status: UNSURE (   7.99  )
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

--000000000000bfb95305ff0779ae
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

In my quest to get 2x QCN9074 paired and achieving high throughput
data transfers, I am now facing issues with the AP configuration.

Specifically, I cannot get more than HE-MCS 5 (AP and client 50cm
apart) although SNR and RSSI are always very strong and supposedly in
specs (SNR > 40db or RSSI < -48db).

iw wlp6s0 link
Connected to 00:15:61:27:cd:dc (on wlp6s0)
SSID: Space
freq: 5745
RX: 1073584482 bytes (708567 packets)
TX: 355824214 bytes (256143 packets)
signal: -40 dBm
rx bitrate: 1729.3 MBit/s 160MHz HE-MCS 4 HE-NSS 4 HE-GI 0 HE-DCM 0
tx bitrate: 1729.3 MBit/s 160MHz HE-MCS 4 HE-NSS 4 HE-GI 0 HE-DCM 0

In this case iperf3 shows ~950Mbits/s transfer speed. I am hoping to
get at least twice as much.

It seems to me that either mac80211, ath11k or hostapd are not
advertising the available capabilities correctly. I have tried setting
hostapd he_basic_mcs_set=65530 or others but did not help.

I have added ieee80211_regdom=FR option to cfg80211 module on the AP
side. Channel selection is done with ACS survey. I also tried other
channels/frequencies without success eg. 5500Mhz.

iw reg get
global
country FR: DFS-ETSI
(2400 - 2483 @ 40), (N/A, 20), (N/A)
(5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
(5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
(5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
(5725 - 5875 @ 80), (N/A, 13), (N/A)
(5945 - 6425 @ 160), (N/A, 23), (N/A), NO-OUTDOOR
(57000 - 71000 @ 2160), (N/A, 40), (N/A)

phy#0 (self-managed)
country US: DFS-FCC
(2402 - 2472 @ 40), (6, 30), (N/A)
(5170 - 5250 @ 80), (N/A, 30), (N/A), AUTO-BW
(5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
(5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS, AUTO-BW
(5735 - 5895 @ 160), (N/A, 30), (N/A), AUTO-BW
(5945 - 7125 @ 160), (N/A, 27), (N/A), NO-OUTDOOR, AUTO-BW

Current setup is:
- Intel x86
- Ubuntu 22.04
- Kernel built from ath 6.4.0-rc6-wt-ath+ (commit:
c60d15f389ef9832a8da410e438d81b10327751f)
with commit reverted from the bug ticket I opened
(https://bugzilla.kernel.org/show_bug.cgi?id=217536).
- 1x QCN9074 as AP, 1x as managed client 50cm apart
- Both AP and Client are running with the latest 2.7.0 FW.

I have started from this ticket
(https://bugzilla.kernel.org/show_bug.cgi?id=217286) hostapd config
file, and adapted, please find attached.

Anyone seeing what could be my issue / how I could debug further ?

Thank you !
Tanguy

--000000000000bfb95305ff0779ae
Content-Type: application/octet-stream; name="hostapd_ath11k.conf"
Content-Disposition: attachment; filename="hostapd_ath11k.conf"
Content-Transfer-Encoding: base64
Content-ID: <f_ljcu2vyj0>
X-Attachment-Id: f_ljcu2vyj0

Y3RybF9pbnRlcmZhY2U9L3Zhci9ydW4vaG9zdGFwZApkcml2ZXI9bmw4MDIxMQppbnRlcmZhY2U9
d2xwNHMwCmNvdW50cnlfY29kZT1GUgojYnJpZGdlPWxicjAKc3NpZD1TcGFjZQojaWdub3JlX2Jy
b2FkY2FzdF9zc2lkPTAKbWF4X251bV9zdGE9MjU2CmR0aW1fcGVyaW9kPTQKd21tX2VuYWJsZWQ9
MQppZWVlODAyMTFheD0xCmllZWU4MDIxMWFjPTEKaWVlZTgwMjExbj0xCmh3X21vZGU9YQpjaGFu
bmVsPTAKaGVfb3Blcl9jZW50cl9mcmVxX3NlZzBfaWR4PQpoZV9vcGVyX2Nod2lkdGg9MgoKaWVl
ZTgwMjExZD0xCmllZWU4MDIxMWg9MQojZnJlcWxpc3Q9NTUwMAoKaGVfc3VfYmVhbWZvcm1lcj0x
CmhlX3N1X2JlYW1mb3JtZWU9MQpoZV9tdV9iZWFtZm9ybWVyPTEKI2hlX29wZXJfY2VudHJfZnJl
cV9zZWcwX2lkeD0KI2hlX29wZXJfY2VudHJfZnJlcV9zZWcxX2lkeD0KaGVfYnNzX2NvbG9yPTEK
I2hlX2RlZmF1bHRfcGVfZHVyYXRpb249MAojaGVfdHd0X3JlcXVpcmVkPTAKI2hlX3J0c190aHJl
c2hvbGQ9MAoKI2hlX2Jhc2ljX21jc19uc3Nfc2V0PTY1NTMwCgoKaHRfY2FwYWI9W0xEUENdW1NN
UFMtRFlOQU1JQ11bVFgtU1RCQ11bUlgtU1RCQy0xXVtNQVgtQU1TRFUtNzkzNV1bRFNTU19DQ0st
NDBdW0hUNDArXVtTSE9SVC1HSS00MF0Kdmh0X2NhcGFiPVtNQVgtTVBEVS0xMTQ1NF1bVkhUMTYw
LTgwUExVUzgwXVtSWExEUENdW1NIT1JULUdJLTgwXVtTSE9SVC1HSS0xNjBdW1RYLVNUQkMtMkJZ
MV1bUlgtU1RCQzFdW1NVLUJFQU1GT1JNRVJdW1NPVU5ESU5HLURJTUVOU0lPTi00XVtTVS1CRUFN
Rk9STUVFXVtNQVgtQS1NUERVLUxFTi1FWFA3XVtNVS1CRUFNRk9STUVSXVtSWC1BTlRFTk5BLVBB
VFRFUk5dW1RYLUFOVEVOTkEtUEFUVEVSTl0KYXV0aF9hbGdzPTEKd3BhPTIKd3BhX2tleV9tZ210
PVdQQS1QU0sgIAp3cGFfcGFpcndpc2U9Q0NNUAppZWVlODAyMTF3PTAKd3BhX3Bhc3NwaHJhc2U9
MTIzNDU2NzgKI3dwc19pbmRlcGVuZGVudD0xCmVhcF9zZXJ2ZXI9MQojd3BzX3N0YXRlPTIKI2Fw
X3NldHVwX2xvY2tlZD0wCiN3cHNfcmZfYmFuZHM9YQojbWFjYWRkcl9hY2w9MAo=
--000000000000bfb95305ff0779ae
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--000000000000bfb95305ff0779ae--

