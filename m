Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39487C43458
	for <ath11k@archiver.kernel.org>; Sat, 11 Jul 2026 17:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDWt+yLeMp6nVEph2KabjKc/xug1a3uEZ8e5JaHfa5E=; b=GIqLO4A7+pox5iuPbPBT97J99b
	rierX3sHX0ZKmanutmxKw7Kzh1TFiqexD5MJVGpsDYH07vtM4Az0iJXX4j17qhHcHs58uxd3ot4VO
	OExG39aqAM53rIuOfniFUC7AXhK6FnLt9L+NZEBPy+oneaSIzPJHFM2MEQ6eQmOybWnT87bIkiKXQ
	/RY/9V4DKCS00SBGBpJR4y35MXp5cSHkW+jXyzqxzRYZq8DItwNQUeLJKnni4DiFd7/HZkS2KHWgV
	oi8amzo4f+t0Ziug+QBMW4imw/tRJ/5PdUsAD632IgFqMhME+Plin0UgSAq0+bHJSaG+r4MovVvhT
	HiNKMCWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wibMC-00000006ir8-223x;
	Sat, 11 Jul 2026 17:19:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wibM9-00000006iqf-1Zoy
	for ath11k@lists.infradead.org;
	Sat, 11 Jul 2026 17:19:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BEOOUK4163713
	for <ath11k@lists.infradead.org>; Sat, 11 Jul 2026 17:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDWt+yLeMp6nVEph2KabjKc/xug1a3uEZ8e5JaHfa5E=; b=XyprIyLiyMXY8+nn
	EYa/SHOLGsLJ3nBml8a3VHxvLGKRZJDdTbnaDsOHFHV3FcF4hQauBhkSzIfAL6nF
	TzE3FIXiPo3nbDmwC8m2ju1RHvxEQoVgYBt/7+5gvmlnGTXfZ2BDhSxnr3ktXDog
	ZQx/k3hoR51SdstS4UH2JxOHNyKeUPIoAp5M+tS4HIW2o2hywDIc35FnKUrlyGtC
	p+jtvoHPllGiphzklXk7Q2oaS8nYhOX0dKHYtDp2FBFva//Gsh+lk/Ug0joOUYjW
	siWCMX2bK2O7NDjWiEawulGEsh57JG9tprpFr0Y1YtatvzwM3VuX2h1iQWvd/YZX
	qgxbdw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeaf991x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sat, 11 Jul 2026 17:19:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37d4f23eb37so3239998a91.0
        for <ath11k@lists.infradead.org>; Sat, 11 Jul 2026 10:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783790352; x=1784395152; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NDWt+yLeMp6nVEph2KabjKc/xug1a3uEZ8e5JaHfa5E=;
        b=OZkikpur2d1KNau8zaKtf7+obZLn2Oxy8T505H52yCEk65pmCgrnN9pHRi3HrTuHlc
         8YsW2RBnFNaQ/Cqkee351H0uzlVqe9YX6wuk15Tdn6IxnBwzJmOBf2ulOJk1muVJ47uI
         oRScgS04ysdhi0GpFD+qzwj3qLQUWE++K7zWyote81qTV6WyyGMRsR58KYDkGmqNfE0+
         Yq53uLCcPQNvqEPVVYvI1QTSYPjKTUupFB0AChV+RGAfHVk9TsjbK7EkVXgsMGxnp1De
         tIRlUPet4R+YjfzlGpgQgnp3mDE2COA7/hedbd56e1ALGKNcjhfQI4+9YNzGueHliLqH
         JOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783790352; x=1784395152;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NDWt+yLeMp6nVEph2KabjKc/xug1a3uEZ8e5JaHfa5E=;
        b=gOo9lObcp/uLdvEfETPILhN1oVqeNha8Xd/d0gQ+Qi88TpUX4yPJ1onxovxSrXzwwd
         hlVUzwE6Zsd4NACHvc8je+143Smy+GLZ924QlVIfNC+ylPslt80Obs3USlrUJzsuMITC
         rP3wq9JHIeeJ2g7ZulVSpELj1+iPisurlPcqBIz+SfFy8kDZAEZbJhRo+X3VvcOiPc3C
         onByvTCMvx2fV9bZqNdEBqDaaTL4b4ezzNm6Wujw3FAupF7B5sp+5LOoeu6L3BV1Zxfo
         DMzPnej2N01eTTf3nqrAYtGogDEP41ZFrDzVuNaXY8AgpzXCj0JSYf5i2QObst5SXK+r
         ORug==
X-Gm-Message-State: AOJu0Yzt0lFsDt2GqPAKxJ5Lks5pfSd03pEi2kxU7yqnOhGJ7Je1Rrtb
	AUwmXuI2vrAEHu5fKG+e8JNqBhomPteYrW+Ugokg0C9ePBtlHbJqvlPgX2BFJWwjXc6p8Deh7EI
	kI8Xp1mdjsOGkn+0RtCxSvGwKOgw8vhsvb7tHsnAPWhFX1F4NIou7YJXLM/sljqTWYpUmhd3U
X-Gm-Gg: AfdE7cmcRVXWHYM7m9xXJh1h7dUAejBi+42OTCyrarejZDn6LVmtd4ys2BKoX5Z9+jC
	VGNd9LWBKEGmsw3Es0JBTCHQLrPcFhNLp2WT94YzzNwGYUo6p25/S+GN9JZHE5SKBCuXZ4xd+jX
	U9tlsd6aIttW3Ay2x4/U00LYPFzSYWKtkZ2ug9EjyIVpjPlQln/K8pT8G82V+TKfPHrfil8+qBv
	a7QhOs5uT0QikC1mm6fcdvcnLM4jfe1dzsWfGIIppMcFJ/rMcxiYZn+T+Jsx1EB6PtPrP/hSiR2
	IwyPZBHiUd2z7wp3WamIQScdB9Y1BfyoTeqDMxlCR4xih5vhzTeD0hVQyOR6arcSLxy2KVWzSrQ
	kCMZ45cUgsmfAefQdfODJryWqtVNTixwicMftImtiN8WNW415I2C54lQ970JZow7z+oE6
X-Received: by 2002:a17:90b:2685:b0:380:9d0d:7af8 with SMTP id 98e67ed59e1d1-38dc7758d62mr3281603a91.20.1783790351893;
        Sat, 11 Jul 2026 10:19:11 -0700 (PDT)
X-Received: by 2002:a17:90b:2685:b0:380:9d0d:7af8 with SMTP id 98e67ed59e1d1-38dc7758d62mr3281584a91.20.1783790351474;
        Sat, 11 Jul 2026 10:19:11 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm33747406eec.22.2026.07.11.10.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 10:19:10 -0700 (PDT)
Message-ID: <b087521f-2130-44d1-b7de-caf58c7719e3@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 10:19:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k_pci: QCNFA765 connection failure with PREV_AUTH_NOT_VALID
 / "Secrets were required" state machine crash on Fedora 44
To: Nilesh Kumar <nileshcool@gmail.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
References: <CA+=sdFznhv0RqfNaYYgpit3bqo1kvqDQT6CZta8=ZHPUXZE7zQ@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CA+=sdFznhv0RqfNaYYgpit3bqo1kvqDQT6CZta8=ZHPUXZE7zQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jJiDPnqMHpVpyBlL8oBee36YHk9hQmSa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE3NSBTYWx0ZWRfX6QjJG7d9t09F
 nI2Jk7F3ISjwJXVG2R2gh+fS/OZAInN65dDM4qvUmyeWrYKCbPm/SBDzl8ukaZ0nNhP9jDoKNOc
 +st5IPj4S1BVAe2N4hfGVhV+6wgWIbZQJVRk/r6sJHMuKrNJAuQe4ybjqq/HMA26WoyQIA2G2MI
 h2DVrxkHLyFt3H6wmDVutoPsuXmQFebXU06MzURgkunyMwzwBw9i3Klo9zTD4GDHcZIMkJtFPld
 fHS7TjDXewqlbJkqFxXfYRJlE6rDDCFBjBgqrUrTqP/CoCLtLy8I9d0X6+YasxurKndfny1u9c9
 mIGv3BGyRvFewPUsLlO2Zvu5VmF9ABzUKVS1q+cqWYxuIz+P7UiOcy4qwwGOWAW/4PAMB+qBPuS
 zxA9YAUEUcyDBQk4Pb5yOQJ1vNvX1z1s7OoXE35bKC2qtLk80CIJeEbYQZmGpkpaY9jVryB1z+W
 fxBAi//U1EIgkQphjHg==
X-Authority-Analysis: v=2.4 cv=O5MJeh9W c=1 sm=1 tr=0 ts=6a527b10 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=-7qDptq3HqQkB5VKEdcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: jJiDPnqMHpVpyBlL8oBee36YHk9hQmSa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE3NSBTYWx0ZWRfX67Pnnm938D8y
 CWGOsYC3nEyuzKND663PVRLQYJ13vZfIji5tbhb75mH/Kg3FTjdrGcqrNSDuWjxn1R9OvVEJ6qV
 YiBxunH81DlZpnkr8joSMcWvr5bIeFs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_101913_421806_7EA24DD7 
X-CRM114-Status: GOOD (  14.88  )
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

On 7/4/2026 4:55 AM, Nilesh Kumar wrote:
> Hello,
> 
> I am experiencing a persistent Wi-Fi disconnection issue on Fedora 44 that
> eventually locks up the driver state machine until a full system reboot. The
> network adapter is a Qualcomm QCNFA765 using the ath11k_pci driver.
> 
> - Distro: Fedora 44
> - Wireless Adapter: Qualcomm Technologies, Inc QCNFA765 [17cb:1103] (rev 01)
> - Subsystem: Lenovo Device [17aa:9309]
> - Driver: ath11k_pci
> 
> PROBLEM DESCRIPTION
> The interface disconnects after a few sessions. Once disconnected,
> NetworkManager and wpa_supplicant enter a state-machine loop where they are
> unable to re-associate, repeatedly throwing "Secrets were required, but not
> provided" errors, even when credentials are explicitly forced or provided via
> a passwd-file inline during 'nmcli c up'.
> Even after purging the connection profile, restarting NetworkManager/
> wpa_supplicant, and manually bringing the link up/down, the driver appears to
> remain in a glitched state where it refuses to pass the authentication keys to
> the AP. Only a full system restart resolves the condition temporarily.
> 
> RELEVANT LOG SNIPPETS
> logs generated are attached with the mail.
You should contact Fedora support for issues with their distribution.

If you can recreate this issue with the current mainline kernel then you can
submit a bug report using the guidance at:
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k/bugreport.html

/jeff

