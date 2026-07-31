Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19253C55167
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 03:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StiQNB/VgRXxVtOeJyl+DtEvUetWYYDQ1khQl5juSWY=; b=CiCf5f4Nq5V70QJny16KGWQIYm
	X7oXVVtPQRvkzeURpGOIY3FLIGXdOJegrzp83P+tVlNwoqFxrx7EKr83VRS1g7Ge9Mr03qkwcELL7
	ffh9/NMZvLvZlIOHS0uL7Q0TR6sDGtCDR+uK1xyNY25t6FUYUEEpK9xRru3VGB+dXG+lW+SgZMyX9
	y20PCH3Zd/XnQTgKm/fDod/xmlUTR9Hzg0v48KaTHil52wXfcR9FjEfm882YWTCFKP00eiTkDIJGp
	gtONKBVQWOcwuKlSsWjtWh8YfJGLPfD0HVuDbKqGxnRBN6K2oKi4b3GTa9utl6rnodGFQjKiStIhg
	LFivoSsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpdae-0000000Bets-0dMI;
	Fri, 31 Jul 2026 03:07:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpdac-0000000BetX-0H7g
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 03:07:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V2INPR2781091
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 03:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	StiQNB/VgRXxVtOeJyl+DtEvUetWYYDQ1khQl5juSWY=; b=IfQUe+C7F3CI/DwO
	u8rqx0uFITn9/Z3ZOWTe7Noy5kzFgisOH+VNS4QD5BWvCcL30ZnSiSDUlO+q8RXz
	DmbqqoC0RxX2bI3VZGdV2fahfdaEw5099hTK9tyLy/2JbZm8p9SLqjKw2ry+x73r
	86w4GGsgKi0XSDZqPwr4RCDyre9H55DIEVoXWxUe3+CY2sys+ob1UXNjcPIUJyhH
	qYQymYAmOMENqOT7TyB+u+S5UFCYFMPFcxZNC+KxEDNZr1+NilLNIJY/6ltavVIW
	XcL8hpfRcyvslvcJtPH4WilgdF4emdWgMWtsLMojMPKzrPL/MvQKGjymiFSrQ/kq
	8lzsVw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frjtag514-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 03:07:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9c26587e67so352627a12.0
        for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 20:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785467231; x=1786072031; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=StiQNB/VgRXxVtOeJyl+DtEvUetWYYDQ1khQl5juSWY=;
        b=O/OliYW+7GtRVnAtUu/tMF5eDYZsdHETeUseYlcBGNrZY58x3zvVZYQl/z4jJO1Y/W
         5RXgJLMgE78ppD9DUI+XwJZIGaTlmcynZ6ms2ub2OF5OIeJDJgsCj3NRnW0sQxIrcC5S
         teEpQ8cFrbWAydNWeUSxp1p57BFrz6POGu9sSwygehDxzcE6h1Pl3sASqGIouyJOoHYR
         faOwV8yfNjLseNiad9hVWP/2XFoIL9d4W0CKKC9RsMIWObyJpUgvsBScZmNjK834+X7a
         weOGTlN0vAImQBK8deXeLXVf8a+58/SXOQVbzy98xC5lH3tvcvp8UM+RHDlYBHaRHDER
         tQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467231; x=1786072031;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StiQNB/VgRXxVtOeJyl+DtEvUetWYYDQ1khQl5juSWY=;
        b=ry8FLqVICI59mjoeBwUDk6FQOJ95zjcGkv8MjzBwLb0e11Rp84wQzOL0/DexAxuYzr
         JCxM4iCsx3G2447Z9/RlZhjAzK4z1JfaNVzNGzO8hu9h7G35GZChtPoLa2/NOXaekzOD
         xeyCDQ8gQY2pKsrCkM067mPobBIxQ4qSCR/jyJxi5sW5A/3DVN85BlcZsRTnOOTDBUs4
         I7NrsSJZJj3NE3VE9L+vzexkosk1LcqMhBIhlH2BuDqMhFox3zyqEEiTMTIqOZz+WGTq
         p57GRqH3GHHB7/gzHegt/H5AJH0EslnvjO0oo0LjMpwKoKa/lDZmaW7RqZiMauK/izJo
         d83A==
X-Gm-Message-State: AOJu0YxeBlx3jZAbonWOYBY3se+d/Ms3O3Z6nwUYlp1hJrQWZ4gHjWKM
	lZ0xZNG3XPAfqKBXPbAf2RyrvdXFMDrAaXOJd0wiGG1KBTCVxVsczois3RKJ9b1AXTt1ThR4VD5
	HRx/kgZ8hyAi9RODeN2YSriX1SOU4Gmj2eHrVLAX5mpFlKX7n62MToS/8bi5QmIhoNOp1SKWg
X-Gm-Gg: AR+sD13NjT3G+3iyovYBSl14roWn3gZ/eECW4zoPlyHBWXHr+ptWNA26qsE996Fd+Rc
	zYI2qCc2KjQtOjMH2n4bolnWOUsnt3iQ2FNKzZ8GJgYaC70Acm/EHMUXwIwK1haJmayXrNHBiPS
	zVesfd3WLO1HOk9E/GUHp9cVITAOaasZE8IkxE+3aYZvs8mYLQ8PSrWjdYwS/+0affk88o9JH7R
	/8DEE4Wmwb3ODdZmBIHA6ODo44UrXeKc6aJsTSpWJXXcTJ12M8kAZDBFMFnEEy2mszcn1wBcNZ8
	KWBEPcYeBWLo16c3yjgF6jcQnIXFUBxScNQGYd7/PfYdnL81avTpsVvRhZRCX0U0ZwkKiU06pHq
	pUmkR59dyGmS45crnNaD56ZttAeUACjACtgWX6emDe1E4NAihxmKEFdm6hq3bmLpdQ5urtR6j+w
	==
X-Received: by 2002:a05:6a21:e598:b0:3c6:6f25:594 with SMTP id adf61e73a8af0-3c91aa0a4f5mr251197637.38.1785467231562;
        Thu, 30 Jul 2026 20:07:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:e598:b0:3c6:6f25:594 with SMTP id adf61e73a8af0-3c91aa0a4f5mr251164637.38.1785467231071;
        Thu, 30 Jul 2026 20:07:11 -0700 (PDT)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe3836a898sm101127a12.15.2026.07.30.20.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 20:07:10 -0700 (PDT)
Message-ID: <de4c4eea-4d5c-4395-9a80-bd53f65069cd@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:07:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath11k: fix SoC reboot on firmware
 crash on AHB
To: Julius Bairaktaris <julius@bairaktaris.de>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
References: <20260726221908.104873-1-julius@bairaktaris.de>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260726221908.104873-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAxNyBTYWx0ZWRfX1UI2cAUIGdCm
 e1cvw7YlxczKfVnfmxrb/AxXqr2VZEY+Ra8eMaWK0YwhoFJcWiiPP6kwzVTIKs1Dl9uYPNwiyLJ
 L6+PSpg8xxLeZYJ83GA/tfs0pCAXkjukqSZjuAVWSpJ1B/aULPhkBPby7G+FnLZnPnIbRcuJGjG
 QvagI502Merwn7P0/J4RY/KjbNA/MJ90YXPvIcuS1+Kub8bzUSBcxUih0TC+vdDHheQ6ECJdKol
 a9nXHDXE0/EL3pSGHNR6bhUbvzb97c0pIe6l/Uecgpnvxv/cHATgN5J94Bh6F8wsDuE/EXEzI2A
 Wi0YFABVYQKHEH/6r9hRF5GV4Ovqkc5FKymru4zNH8zNdg1XCGakW52fQiTE6wUX1x7FHoOlnYz
 n/bIXKJEBzBvxvf+vTcVEqruBho1nZR9tR51vCLEeo0+dNOkWceMejRHpccukFlEskIxHbKLeBe
 nPi6oa9369oAo8cM+lA==
X-Authority-Analysis: v=2.4 cv=ZdYt8MVA c=1 sm=1 tr=0 ts=6a6c1160 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hCEygx0HL4Tx5WVe8Q4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: _I9sjCpX-Tj8pyn6ro1OXkUbTAvrxcE6
X-Proofpoint-GUID: _I9sjCpX-Tj8pyn6ro1OXkUbTAvrxcE6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAxNyBTYWx0ZWRfX2Y2QpC6CJBS3
 uTWhA44Wh1DbNLYFwCH8WUgC/J4vrMByuW6BqTr3I5EVFK9k7Iz5UtXaBXZOtLnMJ5JXXkLv23J
 2wc3S8Ogv0mmKY8bqt3NsYTov+olviM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_200714_229647_A145008C 
X-CRM114-Status: GOOD (  21.04  )
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



On 7/27/2026 6:19 AM, Julius Bairaktaris wrote:
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
>   before: 2/2 asserts panic in ath11k_dp_rx_process_mon_status() and
>           reboot the SoC
>   after:  3/3 asserts recover, 5 firmware boots across a single 397 s
>           uptime, no panics, both radios stay up
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
>   blank line
> - use the standard kernel block comment style, with /* on its own line
> 
> v1: https://lore.kernel.org/ath11k/20260725141757.1316877-1-julius@bairaktaris.de/
> 
> Julius Bairaktaris (2):
>   wifi: ath11k: implement CE interrupt enable/disable for AHB
>   wifi: ath11k: disable interrupts during firmware crash recovery
> 
>  drivers/net/wireless/ath/ath11k/ahb.c  |  9 ++++++++-
>  drivers/net/wireless/ath/ath11k/core.c | 10 ++++++++++
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

