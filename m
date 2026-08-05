Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAAAC56201
	for <ath11k@archiver.kernel.org>; Wed,  5 Aug 2026 11:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LelaXGTz4XL4uLm+4h82aJhDgN13LzRGBgOFWlPLZg=; b=1IyM0VSPlyIzbNWTGoqj00jb9T
	AhQNpn9rLxSPxrA5S1W0uGRbVW9lVY8WpnzAjMLyWfRGAv3oMnP/tXyMtOBtmtr6GD4gctgvaNy3B
	w/1gR2yZkfe9lVvw0JA83BGj8XxST192twxSP2tKnqMpJ5MOyhE+zvk9pNyHl/JdfV1vAtvCqfLX0
	+Ksxix6d7uYJOSjty1Vd5yOQlZxyE1UfZEiYAJti0+uQEUNWGgjI3CAeVHKhohGkOe3R+vYeMH38N
	CLuCWhH6FFEpwx5lF7hzCPeZ4yx5m2dvJuKb17Pmpw8aC8zGODnQdwzQq8hx/+A/JnGuARi7SUfeT
	Nk+xLRWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZZT-00000003nS8-0U7Z;
	Wed, 05 Aug 2026 11:14:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZZQ-00000003nQz-04nE
	for ath11k@lists.infradead.org;
	Wed, 05 Aug 2026 11:14:01 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dXM32348585
	for <ath11k@lists.infradead.org>; Wed, 5 Aug 2026 11:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8LelaXGTz4XL4uLm+4h82aJhDgN13LzRGBgOFWlPLZg=; b=YwXgnKXAlAnjbYt2
	cmzHdV8r45lCfnsRC3W5z23np+q46DCNDEiCs3s0A7wnHJ0deRwHq2DDOUngXdTM
	VyXuch6kNuzHUbAYpL81yz4JoT95csry9JCuR7C+7zuL9lNxwXBiomWD/83JXYq7
	sVlqSBWMqaWv6kAVoQXecu9FyoZUIul9fu+ahzphqMqFPRyAevMOnPxp/jCFO7Fc
	R9KVPeo/UWnQaXWGuhw9CvBZFFf3Y0K6g2FHP+LcvrcIh7TTrpFBLXqSXPpnC0tM
	Nf/N9YWM78icez3QD4lSmS+T0W6zA7dEOfRyJIoUrb5RAXrJnJsul+qyDSFJ5YUh
	sJif9Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3nv6y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 05 Aug 2026 11:13:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbbb9c9bfc3so554009a12.1
        for <ath11k@lists.infradead.org>; Wed, 05 Aug 2026 04:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785928437; x=1786533237; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8LelaXGTz4XL4uLm+4h82aJhDgN13LzRGBgOFWlPLZg=;
        b=X8wkE/JmqfnHkfv0tc/GHqNCGbenVCtOVn6ES1Zm1uCtEkyWnxmNxSAuAjeiwV6Ny6
         r1ZjgNlaObKh0585/50Be43UV6DlkdcPnX5B+TxWQN3UNJ5f4fD+ItQLmGmWoeHIqW7w
         DnHiVbsqYYwsho+lwTkg7vq6vjCtHjLOeVEQ9y1+4RnjrxpXrc4G1chPid4UYnJhMsVY
         3g58uQUPz8CLrQhIjMK8C6Zx9MMQ1oI7JZvMUYAZDy1MBR47jJJ4YoLEEZcg1CAgEifl
         LOIwmKXJq21BbNSG2sSaxndUk1o5yyXQcR0vuJzCrTlQXLKsgPsrFqh6JjoF24E5QXbb
         D8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785928437; x=1786533237;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8LelaXGTz4XL4uLm+4h82aJhDgN13LzRGBgOFWlPLZg=;
        b=syIiz+ehrw469Hr8wra+urpVCpNI+QY9kiD8wxCwgdE+pynon4icD1lvkpHfm84mrQ
         8PcgqMa3IfKzFibH5DO81lUYYumdx3z+XKHSbI98w+oMEqVo5lXKeEPCDMOckAdL3H80
         8d7ZjMI+Xrv8ZKErKYNbg25MIbl0DYtN6mNHZF7tKmaoGRzv4FiiPtt9aRplVKeZD4SI
         7bjkdg2ZnpjlXynRrrl7a+Vi8lNQ8ASj025OzoFdjsFP+OKXmuV9WGVzIvhrQYEVWMjU
         TUylJmK08uXTSK/YyN0A6jVm9ed2GA8+eydc8ZmSMK0aynKhIv/JJZVaRx8YAmp/jHof
         iKoA==
X-Gm-Message-State: AOJu0YwcpKSaosR4s+zRcmF+G5yQlH8o8XmPjp8mURbnCp81H5LNcf/I
	5cR5JP4vWDNSb+sMVnLAa/mRENPy5oZWIKLYUTQ1NJVfOalWrvtaut9am+OaGMVATkwImH+IF9U
	DcTZLXBrALUFY054r4COHugBJNQPpd/6LSA2sQDA0R156hPn7q5Y5alcqSVlp3B9i
X-Gm-Gg: AR+sD12GpF8v6lHuNWnOoh7oJzCBpvTEMWrHhpqUj090WdwT7kom7w1PCgbg+slp+U2
	NVU5CMKjeQqAaYLhLZd0qd/09oOYE11hx/DeAVYKZTiNJNMIT4QsCifzp/EKRpW/CNws1EEvekk
	hTcfYFRaFQsvUkdWFWLkuYl/Z8GNRnnFriMjsd1zsguWJw14353eg3HKrRowPEoZ1/9vauXFR6m
	Zn9s2PHX4kP+/IurLHw70Ytl/wx+1E7zjUgfH5kV4vmM9hXgoGd3Nra5hIzfeSWRNlSn6hZ3ywF
	UYE4mipMx/32I9eSqlyJFAeJHwT5rWLr15k50f53wm7bDhIbYQIfVZPIMFv3mZK5z4nG9O3+C8d
	l4fWFMRuv1dGRQVDGbYFAt+SPaPGVPMx2xCcXqJOf
X-Received: by 2002:a05:6a20:4309:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3cb85dee5ecmr6544779637.9.1785928437485;
        Wed, 05 Aug 2026 04:13:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:4309:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3cb85dee5ecmr6544741637.9.1785928437068;
        Wed, 05 Aug 2026 04:13:57 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586447d52sm14481339eec.12.2026.08.05.04.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 04:13:56 -0700 (PDT)
Message-ID: <6c8b8587-8a7d-4e57-81c8-dbd84aa458d1@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 16:43:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath11k: fix SoC reboot on firmware
 crash on AHB
To: Julius Bairaktaris <julius@bairaktaris.de>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com
References: <20260726221908.104873-1-julius@bairaktaris.de>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260726221908.104873-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4OSBTYWx0ZWRfX81i7RY/qwm/H
 NW70U7KAFr5g7Pli+ari2ia7uZufLLe8Bh5dVPii8Tc8dYQa+YLRXESR95bsz6bK4T9WAMqUJo+
 Z7i7zOz+KeXGoZKqxJcfkthTVSMCe71TP4xQdP0xeV0C4FMGFygzHEC7kYVPJw62NpFM6LCKgqA
 ipIQrEEzkV29S5mhMnX9vCvh5LAGpMCxWknHkgVfA4ZL2dqwjzQJzCCZ7MEh47VYTQ2wSm61cgc
 xiNNx4uharwvxqbmsJbjhdyxQlnAtHCW6R8bxeoFMJIUxklh/R2oIr9XGDWM6WYf0RMdUU/jCQT
 GnZji6iyaVY4UYtatdT4SBqlpHq/XAlngZ1furJ5GRn0uEz1tf7E/CVYVyl/ThamR1GEyxCFB6M
 hNFiKPyXefkUpmCVVlKjC0xzpjIim+iZw0YDGRQNgbMFvgbMUchbL6sVwUSZQbwpXluHpIiy+c+
 xTfc52waiRq0tft4IsQ==
X-Authority-Analysis: v=2.4 cv=AZqB2XXG c=1 sm=1 tr=0 ts=6a731af6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hCEygx0HL4Tx5WVe8Q4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: YgwisAcxRqUy-BFske2K-OgrovtfZ3GX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4OSBTYWx0ZWRfXx8XOrh1j1SpX
 dVisqOI59QYyN1ROirenoPVy3SBND8Nktv6Dl5R84PwItkhhRx3NXDqlet4Gn0Kx+y9eMvSi0lv
 ovH/FUnwq7VLbF49r+pdluvHxnrB/2A=
X-Proofpoint-GUID: YgwisAcxRqUy-BFske2K-OgrovtfZ3GX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_041400_219729_D5FEC095 
X-CRM114-Status: GOOD (  21.92  )
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

On 7/27/2026 3:49 AM, Julius Bairaktaris wrote:
> On IPQ8074 every firmware assert takes the whole SoC down. The DP NAPI
> keeps polling while ath11k_core_reconfigure_on_crash() frees the data
> path underneath it, and dereferences a ring the teardown has already
> cleared.
> 
> The interrupts used to be disabled at the top of that function.
> commit d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
> moved the disable into ath11k_core_reset(), which AHB parts never reach
> on a real firmware crash: reset_work is queued only from mhi.c and from
> the debugfs hw-restart handler. Patch 2 puts the disable back on the
> crash path. Patch 1 is a prerequisite - the CE half of the quiesce is a
> no-op on AHB today because the bus never implemented the hif ops.
> 
> Reproduced and fixed on a Xiaomi AX3600 (IPQ8074 hw2.0), with no
> out-of-tree modules loaded, using the debugfs simulate_fw_crash
> 'assert' trigger:
> 
>    before: 2/2 asserts panic in ath11k_dp_rx_process_mon_status() and
>            reboot the SoC
>    after:  3/3 asserts recover, 5 firmware boots across a single 397 s
>            uptime, no panics, both radios stay up
> 
> Note the debugfs 'hw-restart' trigger does not reproduce this, since it
> goes through ath11k_core_reset() - the one path that still disables the
> interrupts. Only a real firmware assert does.
> 
> Patch 1 is by inspection: it makes ath11k_hif_ce_irq_disable() take
> effect on AHB, which also fixes the existing call in
> ath11k_core_reset(). I have not managed to trigger a CE-side crash on
> its own, so if you would rather see that split out or dropped, say so.
> 
> Changes in v2 (no functional change, review comments from Jeff on 2/2):
> - separate the ath-specific Tested-on tag from the upstream tags with a
>    blank line
> - use the standard kernel block comment style, with /* on its own line
> 
> v1: https://lore.kernel.org/ath11k/20260725141757.1316877-1-julius@bairaktaris.de/
> 
> Julius Bairaktaris (2):
>    wifi: ath11k: implement CE interrupt enable/disable for AHB
>    wifi: ath11k: disable interrupts during firmware crash recovery
> 
>   drivers/net/wireless/ath/ath11k/ahb.c  |  9 ++++++++-
>   drivers/net/wireless/ath/ath11k/core.c | 10 ++++++++++
>   2 files changed, 18 insertions(+), 1 deletion(-)
> 


Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

