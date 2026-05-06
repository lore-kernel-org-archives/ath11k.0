Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEB1CD342C
	for <ath11k@archiver.kernel.org>; Wed,  6 May 2026 18:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fW7+cAaB9tFYadSH4iU2QxnEOPZYkbnvDwiqGGx9hdw=; b=XUPxmTb2hb8xOJ6pHk4nTLp5zy
	SUB7pvCZP5VEn4+6WxR13CiKp/uhHsNjWMQTilnSqUReP+eNgnNPtwIZMJSOw3EO0d6SpYSTQuF0x
	cWKOa0OeisfOih0f8YGq5AhzAHTQTLxm34qMwYPDc0IchG7HYMptZ/xNDlccaTxdmIBO31iLP0ZND
	X4YxzjapOCKqi2YCTf2OqoXTbDOHOvZLbBTsOAadG+h1OpswSE0OdqVEffqaoWMDOGa3MhqtdpqcZ
	aywAI5JI28uRnSOWHp7RCzdnIG9rMuwefVF1uS1ZRLPlae9Qbvl4LZ2eED1QPU9h8JFk7iVnxNGGS
	KrIcvZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgqY-00000001kxR-340U;
	Wed, 06 May 2026 18:19:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgqX-00000001kx1-2HB8
	for ath11k@lists.infradead.org;
	Wed, 06 May 2026 18:19:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646EG9003309037
	for <ath11k@lists.infradead.org>; Wed, 6 May 2026 18:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fW7+cAaB9tFYadSH4iU2QxnEOPZYkbnvDwiqGGx9hdw=; b=Brj8A/Zb65emycac
	3xJRMK4BCeAN+LdEAaWbPQMYPEBe5q8uyeizOGzX6DRYj4OHH8BiNdJ63U0NDtTx
	/oFQzG5Y2gm+cdTRQ6gb16EuD2zyg67CAraf1umrds9vnhLY8DwvOLAoeMQf/sj8
	QBdnnN+WLmIlan7uJurTmsrAhiXLx544xLzVXBcZy+NYSe1SYKAOxCwXChQT3uJS
	JinWIQAz2m5cELZZkxA8n41TdSAKjv60TyM4XvTcX7WKppmNWY1QKFZENrYl+5CH
	9RJafTx3bwp4UQNy1ujM256AZz3O+vVQsMnQTwmJDHiOH04FdQRhwjmXwyyyz67W
	Feuucg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e078sgxua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 06 May 2026 18:19:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so8704379b3a.2
        for <ath11k@lists.infradead.org>; Wed, 06 May 2026 11:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778091584; x=1778696384; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fW7+cAaB9tFYadSH4iU2QxnEOPZYkbnvDwiqGGx9hdw=;
        b=VtCkzuL1lORWDH6fTmc5OWm4bAb/mL1i8F3S9JyD2LWKdlof0B0STDrQLOlxE9hJPF
         1jwI9sG6WeRzId5qmkZVuKpRK+0e6uUW5fzEymvsVH2y8SM1FbnPncBH4C9hP650Fg8U
         ZotgPA1HP3U3G6C379i3B49yhMm0kaxZCJzKBS8gktfHAAqFVQAEEUS+kg5WUd5iWFwW
         U7nhaKsZC4l1O5VkIIftFeA2VvwQhc4v1skWCrvJfFO0kmXS0WSyuxHyOyQdWUwFTtRA
         1iYiGrxBDky+49basvN+3McTK63ufU34VOZWOFMhqYQiNVR2bWIYd09qROPXV5cMLRiD
         0jDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091584; x=1778696384;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fW7+cAaB9tFYadSH4iU2QxnEOPZYkbnvDwiqGGx9hdw=;
        b=CfhHWkp0dtM+a99glECL4UNtK1uSXbDy3J1T0c49JyhUTtXFRTxA2+paneFNc2769P
         O6t3bjm8LpVBYXOs00UdWme4cfv3hB0EFulIOnqte0wPRJhjydIr+baCswJVgMnACB56
         ZG1MSwYzB2rVXpqnQeASE0WC8YMJLcLh5e3oKbgYIByvsgm8zPG/9kbs5wrU7N+dkGUW
         UP0G6q6yhDZc31e/ocnkeCK9bvo2uwwEkw4w/BBd5vc2G8V8WMQuErbgW7W6iWoH4Mud
         ZtQ/6K8lHlsPlKbALqAFM3CdVo+AslqJD9IGcGjWnPw+L8OkfAlU1yz1s0I1nuQSkm25
         wuEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+YNiZVXCkEukkxhJ7FpO3aLgBFGXXJ0pQwsh+sN6m9hiLxZTbpZ4HSFbIyWRts0jT9+e16McA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyluFDeSooBc+8qppQ9ZZASSsYkdYirXF6Q6jF0pXp7UqGUXIop
	KDhee3lLDIPSLfdM1ar0xUhjsO8OXw8P8jkr9qd54xOiZUoBQkyYGphM+M+GZdbnfSVkCt9rjuS
	AjMSt6pj6fTzDmKfeg9PZeoD0RJyhPvwQDGZgDTQjJ7zUORZwHWfWjPrYNBLt69p1
X-Gm-Gg: AeBDietwjWlhKbqjvVY95EuIKfjFABO3MwhDcY5HX79A4tbLuU/0JYiB02BRipCDtAj
	vsKuFR6JZ1fxEY2ohTKH1MXhgJpFtlnR2mKfOFnKKAxEtlUAT5dJEX/fGnnIoLw6glBWUXgan3p
	XQGjBZz0vUU7i/B/1p5mXQdVV3IiYq28byIh21VTRaZGvAWKdfDAiNEXmV9KmC65fNR4Z438uCJ
	kyCwXrZ/b4w6t0Gl0wsYK/qSGe5wRSiuT4Pka6MCkfAf1dwmaMsscaoVcga5o0wdq4SzE4xneOi
	iKOtfaSWs/joAa517Erzhy3eisgJKflmaolbQCok3DMhN4cA3DiWEyp31NNAL0hlvkKkOUdsJ2t
	uv/jm8MlK8kxQRJs1XP7d6MN4io/iEIKd65zGTY8UtABm5WeuIDYLDXw3JY+dNMsJtrcxIz8UCi
	20
X-Received: by 2002:a05:6a00:4517:b0:827:3d52:5d1a with SMTP id d2e1a72fcca58-83a58a2afc1mr3812505b3a.0.1778091583963;
        Wed, 06 May 2026 11:19:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:4517:b0:827:3d52:5d1a with SMTP id d2e1a72fcca58-83a58a2afc1mr3812477b3a.0.1778091583464;
        Wed, 06 May 2026 11:19:43 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.82.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659487afsm5831890b3a.18.2026.05.06.11.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 11:19:43 -0700 (PDT)
Message-ID: <005af843-da19-4df9-af67-2cd148b24d62@oss.qualcomm.com>
Date: Wed, 6 May 2026 23:49:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath11k: fix warning when unbinding
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260420110130.509670-1-jtornosm@redhat.com>
Content-Language: en-US
In-Reply-To: <20260420110130.509670-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Lc8MLDfi c=1 sm=1 tr=0 ts=69fb8640 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZCREz13nqshT/on6E9YcPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=20KFwNOVAAAA:8 a=vrVOvOPcliifg5cE6R0A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE3OSBTYWx0ZWRfX3YzqLtsvDgnq
 0h6D0YaEI0e6mumYq8q+CA4ECLU6gnGT8V+yTLFLxUwE654b/u+swQb5YcFsX217ML0yjvzawar
 9EG4xk+NUoVDr9wXFbBnEjpwldGJnGuRvYILTXOKoyRH1sM/L7M+IXj3hF1M6EKS+daot1rZv4X
 6BuDZUbK4558gjjUJ5ul8F2R+30dKsKQFCXfQZMvjUt2bcQN5tstYuAiQkoP/kTaEPuoaFluIbs
 jbCssgvKBXtPPx1CPeXBTke3GxG6W/jdDziEICDXrLiVibE8kYMhRRT/eJWNr3Sqy8IndjjN71H
 q6r82FDQs1AJDJeDV+1Enm3rvB0PZ+8Ef87RkLigzTDRjYMRm6ONc+KD/Ogth4YSx1dc4jLglF4
 RHSbeSTnqG1QJe3KRVMf1YYRScWvyzswKiGJ0Ctiip3k+b41uHYYdleJ6HxotP2r9LVaTc1+Wko
 HSi+mOhyz8qxVcQ0Jzw==
X-Proofpoint-ORIG-GUID: Wet_OGSo_Img9iyOkx54oe_OnWes6nQd
X-Proofpoint-GUID: Wet_OGSo_Img9iyOkx54oe_OnWes6nQd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_111945_599658_7B96FA2D 
X-CRM114-Status: GOOD (  22.68  )
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

On 4/20/2026 4:31 PM, Jose Ignacio Tornos Martinez wrote:
> If there is an error during some initialization related to firmware,
> the buffers dp->tx_ring[i].tx_status are released.
> However this is released again when the device is unbinded (ath11k_pci),
> and we get:
> WARNING: CPU: 0 PID: 6231 at mm/slub.c:4368 free_large_kmalloc+0x57/0x90
> Call Trace:
> free_large_kmalloc
> ath11k_dp_free
> ath11k_core_deinit
> ath11k_pci_remove
> ...
> 
> The issue is always reproducible from a VM because the MSI addressing
> initialization is failing.
> 
> In order to fix the issue, just set the buffers to NULL after releasing in
> order to avoid the double free.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
>   drivers/net/wireless/ath/ath11k/dp.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
> index bbb86f165141..5a50b623bd07 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.c
> +++ b/drivers/net/wireless/ath/ath11k/dp.c
> @@ -1040,6 +1040,7 @@ void ath11k_dp_free(struct ath11k_base *ab)
>   		idr_destroy(&dp->tx_ring[i].txbuf_idr);
>   		spin_unlock_bh(&dp->tx_ring[i].tx_idr_lock);
>   		kfree(dp->tx_ring[i].tx_status);
> +		dp->tx_ring[i].tx_status = NULL;
>   	}
>   
>   	/* Deinit any SOC level resource */

On which hardware did you observe this issue? is it QCA6390, WCN6855, 
QCA2066 or QCA6698AQ ? Also, where do you see the initial failure ? Is 
it somewhere in ath11k_core_qmi_firmware_ready() ?

I am asking because this looks like it may be exposed by commit 
6fe62a8cec51 ("wifi: ath11k: Add cold boot calibration support on 
WCN6750") [1]. That commit added the ATH11K_QMI_EVENT_FW_READY path, but 
the return value from ath11k_core_qmi_firmware_ready() is not handled 
there. If that call fails after ath11k_dp_free() has already run on the 
error path, ATH11K_FLAG_QMI_FAIL is not set. Later, ath11k_pci_remove() 
does not take the QMI-fail cleanup path and calls ath11k_core_deinit(), 
which calls ath11k_dp_free() and other cleanup functions again.

This is similar to the failure case fixed earlier by a19c0e104db9
("ath11k: Handle failure in qmi firmware ready") [2], where failure from
ath11k_core_qmi_firmware_ready() needed to be handled.


[1] 
https://lore.kernel.org/r/20220720134909.15626-3-quic_mpubbise@quicinc.com
[2] 
https://lore.kernel.org/r/1645079195-13564-1-git-send-email-quic_seevalam@quicinc.com



--
Ramesh

