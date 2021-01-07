Return-Path: <SRS0=Hkj5=GP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F7FC433DB
	for <ath11k@archiver.kernel.org>; Tue, 12 Jan 2021 08:13:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 276F622D2C
	for <ath11k@archiver.kernel.org>; Tue, 12 Jan 2021 08:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 276F622D2C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Message-ID:Subject:From:To:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yVtSFaHMD4XGvvVZHKOJgV0PScY6VeKW3qxpftVOHb4=; b=GL55uj66yVzqiUF4Z3L/el4GV8
	EP//oZ7AkmLNj0JpgTOVKf8Ysel4fT7xPK4Wi5US66whBoikHTn5EF0U5lVsL5zJIBkk4B6XYV3NV
	PcYaEEvm/3SNnwWHCqGZyMemGvfBvR8rhgp4PQtv1HsYnMCYPMWR2At8Pigd+TIH4L/uhBArWEP0q
	yxZBVBoHZlvyWlQt/p40KJUlh3KaINZ/jKjvFqVCh5CXF6X+y4p6AeveVlC11nwiZOHh8FnmpWthK
	on9hwjy/08ymmrvl4o0rPP/xBw+FGwr6SYeWlilZqt1eAlISeLQ0v+2LY49Y7yvQcPVfd0tgh75gK
	5ma3kSbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzEoA-0007LG-JX; Tue, 12 Jan 2021 08:13:42 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxJK9-0001a7-Ur
 for ath11k@lists.infradead.org; Thu, 07 Jan 2021 00:38:47 +0000
Received: by mail-pj1-x1036.google.com with SMTP id iq13so378397pjb.3
 for <ath11k@lists.infradead.org>; Wed, 06 Jan 2021 16:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=penguintechs.org; s=google;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=gOztGtwNnglgvJQxK2NuLAf3LWy0E4eIVbS2YGUj91Y=;
 b=Lvhgqt1LlMuHGHiKVUsHGhxs21bDXAvuQ8AvKFYJDeWh8TwkTFR0dATadyjTcyRBgl
 064eUK9eBSMj/5ftzijWBG2eejQs4JfGzoaIPZl1p9GvP2abW43n/p3mltUObhhaGtC1
 xrsV9sJjo3AV5UoZnZ+Xr5txMQHofp0q9P7qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=gOztGtwNnglgvJQxK2NuLAf3LWy0E4eIVbS2YGUj91Y=;
 b=bzEYAsFqzde1YCEvv7Ukjw2HyUKvF9Kky6Pu99hb/SpB5c7H5PYx8HPAuqp2dsKSWI
 +oq0gg+r19hFzRHgxaN4K9G1/GvPcAKBnQWxvdoh/i/wFIjdxEzIy3rfSA9pqEYa+CoV
 6xJA/9L6V3NjUE8f928O/WBKT8jah4Ehh0/B4NO2IFJkxTLRsj2Tc2nJdoP2CWOfW7eF
 6nY6jFjEFNC8YtWkltU46vFSF1YbiDQKGJ0o4+RHZhmU1VuWDDpzU0xGW/XWsB9xhW1Y
 bD7qDCteNyVDQxyhZfH4vUmA+CdvKKe29rRz4XNI13IMymmj6OlanXh76W/GcXy0b+4j
 4a+A==
X-Gm-Message-State: AOAM5300Lk+0HKYxSXRdz6azjeHQMkXsiAj5DH4PYzEwJKJZ5kZTY8jA
 UX+FlUUZu2RxM+n53+a282jxDVL+SSb6/WRb
X-Google-Smtp-Source: ABdhPJzYRFv6QnDv2hwUFTm2XeBlx3d+jYyOZCleZzZJmbbWamhHNmeNiLHLg0ZJIfeKx+8tsaJCKA==
X-Received: by 2002:a17:902:599d:b029:da:fcfd:7088 with SMTP id
 p29-20020a170902599db02900dafcfd7088mr6772041pli.68.1609979922087; 
 Wed, 06 Jan 2021 16:38:42 -0800 (PST)
Received: from braindead.localdomain (c-73-158-172-142.hsd1.ca.comcast.net.
 [73.158.172.142])
 by smtp.gmail.com with ESMTPSA id k18sm3213991pjz.26.2021.01.06.16.38.40
 for <ath11k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 16:38:41 -0800 (PST)
To: ath11k@lists.infradead.org
From: Wren Turkal <wt@penguintechs.org>
Subject: Dell XPS 13 9310 wifi broken
Message-ID: <b50f70f1-7f1f-a19c-9747-fd94a33baf97@penguintechs.org>
Date: Wed, 6 Jan 2021 16:38:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------9911155A22F675C742A0E964"
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_193846_055062_474DE2C2 
X-CRM114-Status: GOOD (  17.25  )
X-Mailman-Approved-At: Tue, 12 Jan 2021 03:13:40 -0500
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.
--------------9911155A22F675C742A0E964
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi ath11k experts,

I am currently using Fedora rawhide and have installed their
version of the 5.11-rc2 kernel. The ath11k driver is broken for
this laptop.

Here's a snippet of the dmesg:
[    3.845315] ath11k_pci 0000:55:00.0: WARNING: ath11k PCI support is
experimental![    3.845652] ath11k_pci 0000:55:00.0: BAR 0: assigned [mem
0x8e300000-0x8e3fffff 64bit]
[    3.845674] ath11k_pci 0000:55:00.0: enabling device (0000 -> 0002)
[    3.845708] ath11k_pci 0000:55:00.0: failed to get 32 MSI vectors,
only -28 available
[    3.845714] ath11k_pci 0000:55:00.0: failed to enable msi: -28
[    3.845728] ath11k_pci: probe of 0000:55:00.0 failed with error -28


I have also attached a full lspci output for the device in
question. I did see the previous thread about this hardware,
and I just wanted to provide another datapoint and see if
there is any way I can help with this.

wt

--
You're More Amazing Than You Think!ymatyt.com  <https://ymatyt.com/>


--------------9911155A22F675C742A0E964
Content-Type: text/plain; charset=UTF-8;
 name="lspci_wifi.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="lspci_wifi.txt"

MDAwMDo1NTowMC4wIFVuYXNzaWduZWQgY2xhc3MgW2ZmMDBdOiBRdWFsY29tbSBEZXZpY2Ug
WzE3Y2I6MTEwMV0KCVN1YnN5c3RlbTogUml2ZXQgTmV0d29ya3MgRGV2aWNlIFsxYTU2OmE1
MDFdCglDb250cm9sOiBJL08tIE1lbSsgQnVzTWFzdGVyLSBTcGVjQ3ljbGUtIE1lbVdJTlYt
IFZHQVNub29wLSBQYXJFcnItIFN0ZXBwaW5nLSBTRVJSLSBGYXN0QjJCLSBEaXNJTlR4LQoJ
U3RhdHVzOiBDYXArIDY2TUh6LSBVREYtIEZhc3RCMkItIFBhckVyci0gREVWU0VMPWZhc3Qg
PlRBYm9ydC0gPFRBYm9ydC0gPE1BYm9ydC0gPlNFUlItIDxQRVJSLSBJTlR4LQoJUmVnaW9u
IDA6IE1lbW9yeSBhdCA4ZTMwMDAwMCAoNjQtYml0LCBub24tcHJlZmV0Y2hhYmxlKSBbc2l6
ZT0xTV0KCUNhcGFiaWxpdGllczogPGFjY2VzcyBkZW5pZWQ+CglLZXJuZWwgbW9kdWxlczog
YXRoMTFrX3BjaQoK
--------------9911155A22F675C742A0E964
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--------------9911155A22F675C742A0E964--

