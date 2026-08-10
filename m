Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49260C5AD5A
	for <ath11k@archiver.kernel.org>; Mon, 10 Aug 2026 02:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZ/XxeklchZuwNvNenrboYqktnOIUOLHiWEgmn9GdIM=; b=RB1tz/TV34cLSC6gOLZ7L4UaFt
	P1uN9YCOuuQLoC1YrPtktgMRtI1HzyYRPjoaLp4CGxLYZv/J3BLRMFHNwY43enh+F3MyaQ74kYAbt
	uqaDRce9Wv4cLs2OVOoUFZ/Bw6cZafQEER/ZgDiZvkYSsfU52xx8hB6/SWB7IjmZEGEl1TOuEsdm0
	rFbwxQLJroiu5rwaMVzqUWZAXgk14+IBqtEjAkMQbL9Oxdx4tSy8dPAw488+D0q4H6FQXF0b5iY8M
	7sLrhAjYWXGkOW9811EYeA+YHMfcLWOv5Oz02ag6A/FOpLBd/v63hO8eJDd/+NSUeVZL/h++02cWD
	sWfzV94g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFmb-0000000Auqo-1cpy;
	Mon, 10 Aug 2026 02:30:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFmY-0000000AuqT-48Py
	for ath11k@lists.infradead.org;
	Mon, 10 Aug 2026 02:30:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679MUBoQ3645433
	for <ath11k@lists.infradead.org>; Mon, 10 Aug 2026 02:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CZ/XxeklchZuwNvNenrboYqktnOIUOLHiWEgmn9GdIM=; b=Ycea5ciJlvSJkmg4
	SQUnPuCyckfSCuCy/wdsSkX6ef296l69hV2CQ0JncaILx8SVitseas2XEIzAXnsi
	VmuHL23OgE8ss7BsJZNcX0hKLUC4vj2RismShqA2oMhlDh4BJvP2J1qSDLd5O3EB
	wnAHyTEu21CtVesgAyU6ihyIFpIjUY7hSEdGEybofwI0JQB80UIRKRko1/mntwck
	YPHLmi1myytdUHOx2uC59YMOTpBWjV2Se+3WnOxsHZbXKaU9IGyVqJBHHrdALFEi
	w6ABChTm7geT7C3Fq4AHqQ727BC1o9ImSJ4OP3wGmv4Ch+EhHfOWkGA8HcG/QOKY
	Z+FlxA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fww7cuyn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 10 Aug 2026 02:30:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cccfa32670so23211565ad.2
        for <ath11k@lists.infradead.org>; Sun, 09 Aug 2026 19:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786329029; x=1786933829; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CZ/XxeklchZuwNvNenrboYqktnOIUOLHiWEgmn9GdIM=;
        b=Y4Z+E9suiqEovOLRjELvPtvTtj9RQEd1xwZvsbI/ZTa68FlLmawlyys1wj+6ycP2vk
         2AFygvqrPymKnrgi66Lvz0B8AUMBKOc65Vl2hETb4LN8+A6VTjblmhUZMSVp8CADpqd1
         QT057Ay255iYnvU7CJ14c0FngGsON3uHwegnbIUnO3zof+C+rWQu+utzZh/xlRL3fS7d
         mLCNMAGaVD8CdCP5fJDJN4bTCthsK6IXtTV5HS3AHrIfLACg5/xVb4d/ylLo8TGkVRVw
         21MhGzEr4+1k/V/3NdwS1jl6oC/F6NR5wckjQu0whyEMnxPIQ3oUhGNbnT1Os1IwDY+g
         HrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786329029; x=1786933829;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZ/XxeklchZuwNvNenrboYqktnOIUOLHiWEgmn9GdIM=;
        b=dPVt5MqAeabmTWmqN5nAxoOMg4f2ESsPqfbktV2sc+JSfYntjynHI6xPEGyCb/TUc4
         +UtSYNU6tvlTrfN4EHdfeTEU1mCmzaimaJL89emNxfN8vm//LM+PFeEbNNcmCpwaZhaU
         O0Xvnym/jc2wZI1oF/TYiJ1nfnXuP6NeLJvvoBcqPgJZ/7OgZaYHuc94jst/VOXKj1Lg
         VEx9gRi+lYJ/1nFW1Fgh3+tdLJozz182PqiyBdAjxEzoVnZjOQodWsoJfvtmSvsuPqbe
         7/Hhgm4nNo63TY4qFu/4tVTetexzBXmuhImROlD8PJnuVSb7yomKeXzVH50TjODXANPj
         7e4w==
X-Gm-Message-State: AOJu0YxmFMHB457gkWl7JM8zyHmrY2PHaqk7CCXXBoV8gGbpZT9HVU50
	JeaCZoc5lzM/kSBhPDqwYewl7/Z84Nw2/RVbhx5ullwQb5aFEhLoC4M3XKTAHsau08+jm9EotPr
	YvJ4NC7F8cygWCNxrx44LFgqc5S0ynI11Q46eu+JI8It/kVLSX+0J50+jVOh5a2cq3P3i3HJe9S
	w=
X-Gm-Gg: AR+sD10j9n4qNytMJKgwQxmZO9wzGakKwGgyw9NSF+VqEy/iTfVP72s+oUbCE/OaLCn
	jpUOtbs4xuhjAYSjS0IT0sD8Zq5gfvT8kUct2xGQdLsbwR3zTVNm7h+88g6C+Y1VXVbhm1QUK0J
	3584/W/Y9S5N+gQnUyc+PKxG4l7pXUT0HtYKbzsOUpfka4qwlDpwv22cRpKga5mL96Ir846qKL3
	SSAbfFIvHiyM4sIosmFanPQt7murRxIF4jgt37odkaULlFiSh4dLy8Au/QgVeNuZOePw1cKL7cu
	o22vzBl/yV7EyhfDK9lefAn1xdpiRqC3BPkhfXfriAJQN7iYQ1CoHjjB0AT0rXjcBO2S7nFOd+p
	r38laa+Lk3UJtZfwtMPJsGmMXU/FH/JLKjAXJMRRNat6JcETg7BKYDTaxRA2o190JUFECGHTh
X-Received: by 2002:a17:902:ef48:b0:2ca:329:3da1 with SMTP id d9443c01a7336-2d0ca77f94amr469476125ad.16.1786329029423;
        Sun, 09 Aug 2026 19:30:29 -0700 (PDT)
X-Received: by 2002:a17:902:ef48:b0:2ca:329:3da1 with SMTP id d9443c01a7336-2d0ca77f94amr469475395ad.16.1786329028960;
        Sun, 09 Aug 2026 19:30:28 -0700 (PDT)
Received: from [10.133.33.47] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14da67e21sm26995875ad.37.2026.08.09.19.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 19:30:28 -0700 (PDT)
Message-ID: <e5e412c3-185c-4230-9dd1-ac4aaa2ec942@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 10:30:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 2/2] wifi: ath11k: initialise the CE descriptor
 waitqueue once per device
To: Julius Bairaktaris <julius@bairaktaris.de>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
References: <20260805192129.61113-1-julius@bairaktaris.de>
 <20260805192129.61113-2-julius@bairaktaris.de>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260805192129.61113-2-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2GFY8iPtaugLRQmZbEsBzB8pWGxYgj-2
X-Proofpoint-ORIG-GUID: 2GFY8iPtaugLRQmZbEsBzB8pWGxYgj-2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAxOSBTYWx0ZWRfX6tsMtZcn2CvV
 TSeY50IFFVD90KsIq4AJHLzR0v+HlVJUghuKNEvWFLD4/8YDavxppTF5x5/armvCoO8JjC6FxpI
 y7wdFemxeTOFAYYG3KacdFZi6sBqGPWzorzejjGW90X0OSLuQw57hp8So+xkwij8tm44LXAN5ex
 +Ijg4HyKOFzqoXXd8XIuk4SlSjXGeQULF7PHq8JKGKUmHW6FNxqW0EIcjyFopyC7p7rxEFf01YJ
 MO0+UhNmEvp7uJUDaxWWPiU2IgaYjSIiXlY9FZkelXWbu7FR1nl46rygf2b8gG4MfRHY1OcHwW7
 ArIUQwQpdpD1F6qEs/KlatSwcYBkv2KR5l3OK0gMrfNHIgNG+RngfjlDP9pt/ar9ER4HMCX5Isg
 JF88FBPrkpIyG00q7Dhcj0yzpyJD/VpgFnIFsr2BHBLuvHYtX7s69KMFBg2MFM3r2KHCzurW/OO
 W5IXFrrCpBUBCuTLVVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAxOSBTYWx0ZWRfX8tt+UfMl94iz
 4VOJJerFcHuTqi9/AaU1zsWq1Ku/+b/6diQJWGKhBLVV5DsAEgfgyRNr5nVrO5RaeMNKZ544Uzl
 34ccZMlhMiWXd//M5xE/wubCjHniG68=
X-Authority-Analysis: v=2.4 cv=IPsyzAvG c=1 sm=1 tr=0 ts=6a7937c6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=doWGV4GgMy9UnfXOfyYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_193031_058753_35B4A082 
X-CRM114-Status: GOOD (  18.05  )
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



On 8/6/2026 3:21 AM, Julius Bairaktaris wrote:
> ath11k_wmi_pdev_attach() runs init_waitqueue_head() on the pdev's
> tx_ce_desc_wq. It is called from ath11k_wmi_attach() ->
> ath11k_core_start(), which firmware crash recovery re-runs through
> ath11k_core_qmi_firmware_ready(), so the head is reinitialised on every
> recovery - including while a task is still queued on it.
> 
> Parts with hw_params.credit_flow clear - ipq8074, ipq6018, ipq5018,
> wcn6750 - take the else branch of ath11k_wmi_cmd_send() and sleep there
> in wait_event_timeout() for up to WMI_SEND_TIMEOUT_HZ. That is longer
> than a recovery takes, so an ordinary WMI command issued from userspace
> just before the crash is still on the queue when the head is cleared
> under it, and finish_wait() then deletes the entry from a list head that
> no longer refers to it:
> 
>   WARNING: CPU: 1 PID: 1861 at lib/list_debug.c:62 __list_del_entry_valid_or_report+0x110/0x154
>   CPU: 0 UID: 101 Comm: hostapd
>   Call trace:
>    __list_del_entry_valid_or_report+0x110/0x154 (P)
>    finish_wait+0xcc/0xd0
>    ath11k_wmi_cmd_send+0x150/0x2f4 [ath11k]
>    ath11k_wmi_vdev_set_param_cmd+0x64/0xd8 [ath11k]
>    ath11k_mac_op_bss_info_changed+0xe8/0xf60 [ath11k]
>    drv_link_info_changed+0x118/0x160 [mac80211]
>    ieee80211_link_info_change_notify+0xe0/0x100 [mac80211]
>    ieee80211_change_bss+0x1c8/0x250 [mac80211]
>    nl80211_set_bss+0x1a0/0x330 [cfg80211]
> 
> Initialise it where its credit-flow sibling ab->wmi_ab.tx_credits_wq is
> already initialised, in ath11k_core_alloc(), which runs once per device.
> The array is fixed size, so all of it can be set up before any pdev is
> attached, and nothing on the recovery path touches the head again.
> 
> Reproduced on a Xiaomi AX3600 (IPQ8074 hw2.0) with a userspace loop
> pushing beacon updates while the firmware is asserted through the debugfs
> simulate_fw_crash 'assert' trigger, on a stock ath11k with no out-of-tree
> modules loaded: one warning per recovery, on all eleven recoveries
> observed across two builds, and none at all over six recoveries with this
> applied.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1
> 
> Fixes: f951380a6022 ("ath11k: Disabling credit flow for WMI path")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

