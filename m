Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5992C55167
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 03:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzd7HiAYU90PZDzWOrAkwis5s2xwB7hkmSB9GxwH6r8=; b=CXrwYIqXECJ9OTvCyUbiDXW9ab
	zoVuby1axfgAYP4QQ5JMudVfQ230BaPCKgm3nxFerFur9FbWwnC0gdnKNcTz+1P35dgvkRTD3XEbu
	dSH4IjfJdX/npbovp4+1DAyINqo1Fb4eEbqnIl3FB1esPxJU0UbqPNdaEJXL7ryCyrhY4IaVxmFnd
	9KC8Pn5XzKDNsly7XuWWaxA5m25O5QFyUb7Yqm461mHkvjF1ylD9+7A/FQ7aE0GeM9TazvOLZBlWf
	SJDrK5EZTFjDV3r9OQ3jzdnZK23AH0pNm9jiKJtAlI/fn7kEpGZ/6bP1WrMrfmnwHzElmcTsxC3F0
	ZS4HPupQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpdWP-0000000Behy-35XV;
	Fri, 31 Jul 2026 03:02:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpdWO-0000000BehX-1KZe
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 03:02:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V2j2qk3882271
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 03:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hzd7HiAYU90PZDzWOrAkwis5s2xwB7hkmSB9GxwH6r8=; b=I7YQky1zuAsGBYd2
	zYz0sty4B+6L7rwHg6mRTdQDUj3xbM3IB6CNUwwilszrkS5KTRpeHuaUvGyq5VvO
	K497+bUMT9VT5BM5iMM0WHIF7g3WA6tHuY7xtWZCdrPEnVtAOYcZrpqYr78KCZl8
	ZkIxFWRGWMVW1NWd0XYiU7pX/7fM+/93vWh4l1KShXrv1foGPSpy9ez7oIf8ymb4
	Q/muY9mLqKTTwf52gvnTu6vX7iiIAQZWmxPSDewxBnRkhcd5bOCBT/zPGiWd9heR
	XOFyse+MAdY0CZGjvbwJ9MvE35GAps0YUPUIp6l+ptZU119ALM3tXJGan7K/KBex
	ssN7tQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frk6r01w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 03:02:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso1968744b3a.1
        for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 20:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785466971; x=1786071771; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hzd7HiAYU90PZDzWOrAkwis5s2xwB7hkmSB9GxwH6r8=;
        b=jbG9iFZBxaTCkVCTV1v9axAGHwHlUw245cZfzuve8fAf06CR3VVcJdZmjyZ92dPfSG
         3rk8yxtKP53xXTCClBcO8Ju+VvqD6IzlmyhBc6Mqpxipyk6/PzGbvcqz+gbs/08+oUEz
         8RaxGqzhNxBqoKPDW8EXcTocLzGNtXtuZlqpsWGASJ9DIUH4FqYTQ+Ot19OAKpqwlApT
         OwLlT2W7jlM4gY14BI6U8EfT4Ph6jwLswYrEnOAqqm2mIRRYXWd9pfI810zi0M8oZvT8
         +52JlhXGFKTCr/zL+reneBB4s0XiMXfG6OtwNTsyvlKgJvjcuLEXOaBsT9z8EcIXV1AL
         zB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785466971; x=1786071771;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzd7HiAYU90PZDzWOrAkwis5s2xwB7hkmSB9GxwH6r8=;
        b=GDoTAkmT/+GLug8ZICWEz5ypziB2e/lSLCrh4i1HcwOK3qqznF5b1lIjaZsuz6h/d2
         UdmITuTk3CSFswviMIP0insSBPZG4Rh7w6x3GCm8wKI5amosPeMFyCIn79koB2tc9RIK
         BkBWpH22qgaHtMlaLF4Mq+LJ7cCZgm7l0Ab+yUouczZrCz6OmHh9OJ9FWkgkHQYHaFRT
         9thNtkFeIuo6F0zO7kT2yNDXeDaSs4839oeNbkHsrAE+45FbQIu6m8LMg7X/G/K6TaFA
         4hhe23Uyge+Yv4WXUMN8P2bvIjCCDjX/b195auQgZoydgEXqEdvdxl5TUoAZ2HRuuQqK
         P0Xg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2f/klQMkXWaTdsYw6TTrTg7TDpxUxJehLyMQV/1fIyONanAELkY3qIY46cqYF2srAyUOPp1A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyld9O/fsC4L5WmhHt29dpxWRoGGCg80FGN4PHiwlYjik5XueHm
	ks63YtMSlPRaReH/WQRxDDmPuWIzOrIsr2ZJS6PCsYEGqxaxdmUwm+gMnuJ6z5FxNJ8LiQY1O/z
	hf3d1w2wKCB4/h55LPaE7MKLSpz8NkVCrjgYVVs3Z72gdAk6kpPjmG1HXy2ksy/xO
X-Gm-Gg: AR+sD10xzWvJ7wSrPXiQWr2TQoJif52CD3PlyeD/cYmUKhHRrms5F07SwS0cU7RaUuN
	DB5ff3PEnz5QBtgOV0Vpox5Qs//h+Rw2QCgsS0h+EGvDC71Na1+7kzDqGcfxJ+cc5Ohl8xgwL+N
	9NV+/M0VGDOBYnYuGjOihXp5FCGKAR8kXpwW70/k7Omqd6KSn35A0B9srli+nBike2gMpmLzxst
	DFrzK2d+tK0j6XRtdI8MCUY0mZ+3/HxfJhRGVyGt3yXE9RAJzqV+wqX4ERe7lDpdJKGHOJPkiUX
	+WCTCqDv9sxW6K21pfP2oV9vQLPHj3Z5yVxReXu2St1AEz8yHrn67+ZneayBNasOfcJxThCX11W
	VnU7J5xcru2fBLf+9XKccMXRrkCNh8vyic0YOlN4QQrbkVGb2plPipPZ99Xo=
X-Received: by 2002:a05:6a21:3417:b0:3b3:ccd0:cf62 with SMTP id adf61e73a8af0-3c91a9ebf03mr237452637.36.1785466970698;
        Thu, 30 Jul 2026 20:02:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:3417:b0:3b3:ccd0:cf62 with SMTP id adf61e73a8af0-3c91a9ebf03mr237410637.36.1785466970071;
        Thu, 30 Jul 2026 20:02:50 -0700 (PDT)
Received: from [192.168.1.9] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153aeaa6f5sm991434eec.25.2026.07.30.20.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 20:02:49 -0700 (PDT)
Message-ID: <071813f8-c384-4e81-b395-c213330a6745@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 20:02:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath11k: cleanup arsta in
 ath11k_mac_peer_cleanup_all()
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260730140232.133500-1-nico.escande@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260730140232.133500-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hLCag2BjZ6RGFQrXZFMBt8RC7mZsGTBm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAxNyBTYWx0ZWRfXwTSCW8sGnOLT
 ujpYBINpJCVfTW0lVKlujNSOZ2IvJGg6xYLHgPMo8JxaMqiW9guA4M6ZLAFm/nhmlxCid5ovoes
 7rWLGKJtW4LNxzsBaMNzDPAxCo6nJnI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAxNyBTYWx0ZWRfX4os4bTExgqj6
 Scg9Y09RasxAtTpO0Sghdi7eilOTEgGWzO2QprQpBMep86+1FS5OOTiQmHwpyBqQMG3lBMBl9+i
 o8oXbO2HP2XrylgoWUsSmeNw+fy3zu3gWwV4ga+Q3EV5YIHVeH3T12XLwoz21/pQT8xvEpVcjK8
 tQg7mRZcNWVo/7sJj5Bc3v7YE7LrbEzk9TGTIIRYQuM7Yldq4XqrDpX5pay/8Wt+hbDydK15xQA
 M/Hf+H1Opfq9Xk9mHgr+s2VluBlXzTZyQsNdnv1eZwzGJfdIApLGpW1HgJZD2G94RPyRDGSb9py
 e3NvZP1AI6gzHDXxGCsgXHUJs1zeBbRh7a6cHsYiboVL03BHMncM/RiFB+xiou682dZMvTunTgb
 0JRFRnsH/wtOp6zqy5h/mlc40uDFUuwcY0S/I+ZNZPj7XI0AIqH4zjZenKybjv/cK2ZHlr0rhh2
 iHJIz6Hf8Q4bTqesTNg==
X-Authority-Analysis: v=2.4 cv=QIxYgALL c=1 sm=1 tr=0 ts=6a6c105b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=fPzbls-HzLpkS3J7q7oA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: hLCag2BjZ6RGFQrXZFMBt8RC7mZsGTBm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_200252_369983_7C9A62D4 
X-CRM114-Status: GOOD (  19.98  )
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

On 7/30/2026 7:02 AM, Nicolas Escande wrote:
> When mac80211 removes a sta, it calls .sta_state() which in turn calls
> ath11k_mac_station_remove(). In that function we clean up both  peers &

nit: extra whitespace in "both  peers"

> arsta related resources.
> 
> But when the firmware crashes, ath11k calls ieee80211_restart_hw(), which
> assumes that all driver related resources are cleanup up beforehand. This
> cleanup is supposedly done by ath11k_mac_peer_cleanup_all() but does not
> in fact free arsta->rx_stats / tx_stats.
> 
> So lets extract the arsta cleanup from ath11k_mac_station_remove() into a
> new ath11k_mac_station_cleanup() and call it from both there and
> ath11k_mac_peer_cleanup_all().
> 
> This should handle kmemleaks reports like:
> 	unreferenced object 0xffffff801ae66400 (size 1024):
> 	  comm "hostapd", pid 1306, jiffies 4295011565
> 	  hex dump (first 32 bytes):
> 	    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> 	    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> 	  backtrace (crc d61c08ec):
> 	    kmemleak_alloc+0x3c/0x50
> 	    __kmalloc_cache_noprof+0x2b0/0x3e0
> 	    ath11k_mac_op_sta_state+0x1dc/0xb10
> 	    drv_sta_state+0xac/0x6f8
> 	    sta_info_insert_rcu+0x314/0x5e0
> 	    sta_info_insert+0x14/0x38
> 	    ieee80211_add_station+0x10c/0x1a0
> 	    nl80211_new_station+0x3e8/0x680
> 	    genl_family_rcv_msg_doit+0xc0/0x120
> 	    genl_rcv_msg+0x1b4/0x258
> 	    netlink_rcv_skb+0x4c/0x108
> 	    genl_rcv+0x38/0x60
> 	    netlink_unicast+0x190/0x278
> 	    netlink_sendmsg+0x15c/0x370
> 	    ____sys_sendmsg+0x120/0x290
> 	    ___sys_sendmsg+0x70/0xa0
> 
> Tested-on: QCN9074 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 9d5f28c1366f ("wifi: ath11k: fix connection failure due to unexpected peer delete")
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>  Note: this problem is in fact older that the referenced commit, but as
>  it would need another patch to backport to older kernel and the leak is
>  quite minimal & seldom happens, I was hopping to not have to do it.

IMO you should have Fixes: identify the patch that actually introduced the
issue. The stable team will backport to the best of their ability, and you can
always choose to not have it backported to LTS kernels that are too old

> 
> v2:
> 	- rebased on ath/master
> 	- no code change
> ---

my review agent had no issues with the code change

/jeff

