Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8A2CFD36B
	for <ath11k@archiver.kernel.org>; Tue, 25 Nov 2025 02:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFdWkq7N1RePZ6lwSsd6umoHDAVLFcodQErTRhz0ZLw=; b=F5PVXrKXj/CDk1ololbqHmQEuh
	xRgKWNXgNr8PYponPodHG0poAXqYb+WdKrsEj7/3e2l1JPa08Zu46Yp5Oj+hIA4Ig0ldRzM3zamsl
	cwT0B6kkAKRzKFvhojmoU4jssVDHJ30OPvjEwGAQl3BXO4xd/mUo51u1AB4YuTr+/ydJq+rZ2xUbb
	6reGcpBHO92nKzfGTg6SPaXPBaMfikM4MOXjuhKbU/XHBSO0PZ++4OdUxaHraFhO5o3ilGYb6AP23
	EZYEDvA+grF7hQZ+yEayO/oAb1EDAgXwPU6V/GkmsiWFKCj+29VYn9D7EMeYd5yNdsU9hvx6IG6uw
	yf+bqDqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNin8-0000000CcPh-3Vfx;
	Tue, 25 Nov 2025 02:28:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNin6-0000000CcPH-2UlD
	for ath11k@lists.infradead.org;
	Tue, 25 Nov 2025 02:28:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AONKeW6817768
	for <ath11k@lists.infradead.org>; Tue, 25 Nov 2025 02:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rFdWkq7N1RePZ6lwSsd6umoHDAVLFcodQErTRhz0ZLw=; b=ejpGSCoYOo4UfkTX
	EryBd9HxLb4qZmpPnRT7eSOVGx6kG3dBPBADuUa0SJysUNEphfk/vdWl6Uvz9hol
	JN2Z4lAVIPrAn2J21gjsMK98IFX+u2EphtTqOHJ2WbVEymPGN/lUJGZ/LTqKtenK
	lCb5zAJGw+U6bVIiA0Uj53xvbPlNx8soK+ethhR7s9kUEgXiNwB4GW1CqpRmcATC
	jbJRxmMwyYQ+FR2ot7Y3pLcQ4N1c7GMFutz54+sWvmhHFMnckLKSwdkZ5aJzu/19
	O+k28Ol7HHWRILr47Hu9MhY+0zAnbRU7s06yiMp1o2O+w8Ou9N2pXUNX5Ry0Ivli
	8ofzRA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an0xygca6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 25 Nov 2025 02:28:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297dabf9fd0so64433225ad.0
        for <ath11k@lists.infradead.org>; Mon, 24 Nov 2025 18:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764037707; x=1764642507; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rFdWkq7N1RePZ6lwSsd6umoHDAVLFcodQErTRhz0ZLw=;
        b=D3rJIP2yQa2u5/rG6mIw9eBOnJK8g1NWBzcGtN62t/NdsoPWnX0PnCswSvlUugseqi
         7aLGHihEeE3cponuMyiCvU9PYS8wP4cXVFsXChzH7JYprYKiecBLNgib0Pu1L6tsjt7n
         PLcmG3sRN/XfqtYwDjvJaYbQepKJLQ5fx92hoQMPTUD/5QjU4jZpEyIQRJR1PYM6i8wF
         0KbZN5DsnN4HSZ0DrmXt6joiZp9dRSMstcr2dI4LBtIzTK8nA4YHPEhZLkDfvuZs5y45
         Y3ZIGMrBvsc25VZ325erb7paaKbYocPyL1n3km2Wdd+KRxyFFkG4ZZK5k5WjhJW5iiv+
         /ztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764037707; x=1764642507;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFdWkq7N1RePZ6lwSsd6umoHDAVLFcodQErTRhz0ZLw=;
        b=xBZuFVPVkReoLzalkSmzgBl607MZ+OkSx2xankC0uithk+r71adBnJd6nPJIjExMdt
         9Qb3WMCsuZi4vtOic9Rn2XflvY8JdUWhDsxPjislkr5jFVyMQcW+iETnr/IsyPYOKOGf
         2TNOTOTSVGp642OI561bgIJ5Ykx12z6CPDrMTUbP2kpmqfYKAohiIFHvbIj3o9FqD+5x
         PPH+Wut6blCpxAdelj/H1mBXlJIwhpTUbswjFXWiS9kSrvEmNIYCW28ctsmQ7Une0vhu
         tPbYzcH0IqIEE77xqs84zb2+Gj6xrqv0EXLSMjW44e8beeC334wn19+ScmZWU/E9hgwa
         mUBw==
X-Forwarded-Encrypted: i=1; AJvYcCUxePmO6owfYxwhMFefycvP+qOKPGYumGUjmm2p7quvqcOw9ewz39MOgvt9mscvUqRx01z55L8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPKN2TnnyhEA3Lxslo+JTiQkb33CFW95djgHGZEf82XbbXcqu9
	EaJYkQNvS2z6dM/hEHrSBW3B/w7qLBmlA5tUb/l0JmZNdshLWKQjVUPgftrFlnTnlCWNOlFLgSO
	YAmNFBZrsKBpd69iUT8WxZ13aJPVKh4IYTG+o0YpEDPBR4L9SV0nafwUOxf8BgvJ6
X-Gm-Gg: ASbGncuQKYUq5g9uB0gU1jrl2trR0tzdqhTgYUHKjXb5NVtmqQAb6JEOCM0N+oO83q6
	uXhJqKNWnIOVa+lTq9Kdrbr8BH7VkOpTlNuVGPdMgaytDXv81WWbNCcoc25cyFvwkvRa31QKUIR
	zLToP++9SAFPKrlMyKaQYEup4PCzaXdNZtjkYT3SfEaVsZrXndQNYJrEf8pkHQhCLoJWoD2QQb8
	+GCxJdoInt1lCrFl49Tkc+PgWuyEo/SWKcQeinzDzLiiOonI4SFLM7YUGtznzP6k6wp5UPOlLQ2
	Rv3xME4u26MmoyavKwE+k8N4cRxICIFoPRnwgeX71axHYz+6oRkRf3i0PM9suOQmcIRmvID5oHM
	u5qn8G9N90a5gWKCPsU6Yxx/+dEog7CUd+5jH3OG5zl2rRj86aw/g6jewR0bPcuqCiDkQPXA=
X-Received: by 2002:a17:903:234f:b0:295:fbc7:d282 with SMTP id d9443c01a7336-29b6c508ac0mr173524335ad.27.1764037706883;
        Mon, 24 Nov 2025 18:28:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjBo6RVBZ5IwaETl5nIDAqZ2ejLZcrLB5pPI4JUiOaSHlNao9XT76E3M8BAUK8hMHqp2LcMQ==
X-Received: by 2002:a17:903:234f:b0:295:fbc7:d282 with SMTP id d9443c01a7336-29b6c508ac0mr173523895ad.27.1764037706293;
        Mon, 24 Nov 2025 18:28:26 -0800 (PST)
Received: from [10.133.33.245] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b2ad64esm149737795ad.94.2025.11.24.18.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 18:28:26 -0800 (PST)
Message-ID: <2faa8f4e-cb30-4e91-87d2-853c90458b01@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 10:28:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Add quirk entry for Thinkpad T14s Gen3 AMD
To: Takashi Iwai <tiwai@suse.de>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
References: <20251124134713.5819-1-tiwai@suse.de>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251124134713.5819-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+bUAYsP c=1 sm=1 tr=0 ts=6925144b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8
 a=QuBVaXi81INSSeWXjd8A:9 a=QEXdDO2ut3YA:10 a=QxBQvo9kKf0A:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDAxOSBTYWx0ZWRfX7cfj0+WdGpNW
 umTSrwzyhSdhIaCokirVeH2k+O4OtxmdeObptu0GMKWtRuv8b1aBpgtY2LHDlj+HZj5A+hLTB34
 TgHl7aGfJ1xlUpYHUALpzbO+bI7qyAjl9amjZwUBltnbYjo8rAKiPaY9Szpgpz6sVeMpFz2DHM+
 hWuAf7SyjjtIrd0bo7ATQTN9grHsOflBi1gTJ7zs3dBF0jsruECyxo5V4jmLxg/kBIjtQs+r7Em
 rFzh3wJE9gHzflS7OlpxF+shuJGDexX7ymr3nbAAvK7W7c9DnwBuvY5h5MwkqcOzFAf+00WYU6Q
 bB9McKVsUU34tNo0tW5KL50nLB7JFnFQyFbiH3zFg7k2eZLbMPWKRkOsaT0KP95miWtGvv4R31C
 m1yrzKlYdYqKtnnj8ige4cOt3Ln0Ow==
X-Proofpoint-ORIG-GUID: IksERlowQFN3D82maKUvZLiB0oPZiKtn
X-Proofpoint-GUID: IksERlowQFN3D82maKUvZLiB0oPZiKtn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_182828_677970_C1ADBEF0 
X-CRM114-Status: GOOD (  25.68  )
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



On 11/24/2025 9:47 PM, Takashi Iwai wrote:
> The recent kernels showed a regression wrt suspend/resume on Lenovo
> Thinkpad T14s Gen 3 AMD model; it fails to reconnect on resume after a
> long time sleep.  The only workaround was to unload/reload the driver

how long? and with a short suspend you don't see the issue?

> (or reboot).
> 
> It seems that this model also requires the similar quirk with
> ATH11K_PM_WOW which has been done for other Thinkpad models.

the quirk is to workaround the unexpected wakeup issue, which seems not the same with
yours. Hence not sure if this is the right fix.

> 
> Link: https://bugzilla.suse.com/show_bug.cgi?id=1254181
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
> 
> I'm not sure whether this model has another DMI entry, so put Mark to
> Cc.
> 
> Also, I wonder which Thinkpad models are rather the ones that should
> *not* take the quirk.  Since mine is Gen 3 and I already see Gen 2
> entries, which else remaining...?
> 
> 
>  drivers/net/wireless/ath/ath11k/core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 812686173ac8..3aa78a39394b 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -924,6 +924,13 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "21J4"),
>  		},
>  	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* T14s G3 AMD */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21CR"),
> +		},
> +	},

so with the change, the issue is not seen after a __long__ suspend?

>  	{
>  		.driver_data = (void *)ATH11K_PM_WOW,
>  		.matches = { /* T14 G4 AMD #1 */

Hmm, I am feeling that we need to dig more to root cause this issue. Can you please help
to collect verbose wpa_supplicant/iwd log and kernel log?

wpa_supplicant:
	cd /lib/systemd/system
	diff --git a/wpa_supplicant.service b/wpa_supplicant.service
	index d5c7ef8..69693d0 100644
	--- a/wpa_supplicant.service
	+++ b/wpa_supplicant.service
	@@ -5,7 +5,8 @@ Before=network.target
	 [Service]
	 Type=dbus
	 BusName=fi.epitest.hostap.WPASupplicant
	-ExecStart=/sbin/wpa_supplicant -u -s -O /run/wpa_supplicant
	+ExecStart=/sbin/wpa_supplicant -u -s -t -f/var/log/wpa_supplicant.log -dd -O
/run/wpa_supplicant


IWD:
simply add '-d' option when starting it. You may directly add it to the systemd service
entry if you like. See

https://archive.kernel.org/oldwiki/iwd.wiki.kernel.org/debugging.html

