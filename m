Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE483FF8855
	for <ath11k@archiver.kernel.org>; Tue,  5 May 2026 17:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiK9+lfdONsd5fbVNETZ6m4mczFbTzGNIYa6E31bfJw=; b=fLBwK/L2HklcH0vG4ECgeE/iFp
	KX4AuFFiieEYCxNDeKF5IXHCuw3flBxfooJ0ZS6kH36NJxkTNjuYxNRey+hcqJ3LCLE2UHonU5Cg/
	qIeuTdHfEfVOTQPzdUg5AL+KJErEua8ncFLdNhMfla6J8ny852N9oqFluqHf87SG2+S1C55uqomGp
	tHpUNZWi2aDs06PdpS8S2QXjEVxbUZX2zDIyutLSCWkc038gF4tALCuFRTfU4YSA/FvKCRLfFzgA8
	mnY/6CnxnW+MdZE+SYhNpTGH3fCHxsZMCCBCJvuQ6txw1TXy/foI2hT9bmTTDNuZLLflVRfqiHtvw
	HrhlwDdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJUw-0000000H2sr-1J7c;
	Tue, 05 May 2026 17:23:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJUv-0000000H2sh-1sfi
	for ath11k@bombadil.infradead.org;
	Tue, 05 May 2026 17:23:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FiK9+lfdONsd5fbVNETZ6m4mczFbTzGNIYa6E31bfJw=; b=aHN+BUDV5yefxrz+cSENKTOxtZ
	9GNdWVY842dA0p6psARWtseLiKVBENcbIjqB6T+UKiYPKtobmMkqmf3vRxbuc53m0b2PHy63DFASN
	xwNti03O9B8hCCB2LikG4eD4S3qxZjircqpcn+9/vMeHAY4W7RpiBWzyyyeyeVXIpxoFJoT+hnrxE
	KqLKzla2SXbhK/3M2ISVTh99oQtErvZhx9UtnOVwTig3zv4zaa3wi2GNaVU+YP4pZzipyWuJgAriz
	eOU4KYy8kEVWG/2Kd0cP9Q8CO0tii2fwmLXJabeoQmGAgRux1NksqVw2DBJkvKwwT02XlRstduhD3
	ekwZe0BA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJUr-0000000E9J0-3UVU
	for ath11k@lists.infradead.org;
	Tue, 05 May 2026 17:23:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645DjdqF3501563
	for <ath11k@lists.infradead.org>; Tue, 5 May 2026 17:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FiK9+lfdONsd5fbVNETZ6m4mczFbTzGNIYa6E31bfJw=; b=fcRNRJ/yPpQYJP32
	i3tMzilpuqv5sBVh47Sr1j+g8LdIPM7ToB8xEvDU24NlL8mvbw5HNLnP0BTdZwex
	NJpCyY1sprRTcljQwccD6oefmMD9GeKoZJtSvMUtCDmJDB2k4zLZefWAdBE+PIoa
	+qzGI6V+lR67u3bJ1QzhqpSjuvptbxCPS7PhaFK0JzqsLbWEu9IGon/6ocB1cQpy
	cdGhPhv9ah64FdJ7oJ45vlfUrE38YrgUFn5hSUdsDQe6AOtdXik37NoNyYNaT138
	wgr+a10HLejMeITMZLEWzo4B+Ai1ZlFNdUmLPmGKp0ihaIsLLP5uY4e5tLeh3Bwn
	6mUDzw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyhqf8xrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 05 May 2026 17:23:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-362d9dd9a49so5840237a91.0
        for <ath11k@lists.infradead.org>; Tue, 05 May 2026 10:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778001825; x=1778606625; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FiK9+lfdONsd5fbVNETZ6m4mczFbTzGNIYa6E31bfJw=;
        b=KZToeGZf1MmkcO33NsNBSLevfwLSFMyYnPjlhqBDhuWnIQd5lje6y3FMjarMEKfjEh
         2dqAFxsLyeVMPTBykuCrvVGxDtjeodyTSeKg4XJemoxpdRAjVbKNmqpXLYDLkBq/qjrk
         M24bH0zI5+1nYsQP6urKByfIzH76bzbXrtkYkyoqfWGVg6zckOXWkNiD87vycnMLcwTq
         ugLsq6ZvJH5LCR3oLWLkCYF8oLnFQlafIqYYSHcxXG/EJL9ToiSmorve26cjQYd35o91
         b1hKA1kqCBfUVPmzjpugvtvqxsJW/IVsALOjPkY6BJY5L6pPQXAjSwHNBKFqN9hd4Cgm
         jphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778001825; x=1778606625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiK9+lfdONsd5fbVNETZ6m4mczFbTzGNIYa6E31bfJw=;
        b=eV7Brq3MglNawwGmr4y5rHFCkdv/k93iMjuR0kis56EwDZ89Z3JtH1cyTBnyasZM7W
         ilsAxTK9LqFNuhHIgdgPHldR9gkh55wdPwwMs5Ws+WVwMMnRZOp6PSxbOV0kB6ap7TGn
         o09U2xyqDUPNQ/x6CB/8c0hVOC+eRUdKkAZHCLwXS3Z4ITD6uA4WQ1VrZW7pesQhDSjZ
         s3Y/wceSR0aNhlwBXNTwekPTLT4wDSZVshEibPAeMiEVQQkbPCNSrsm8sby2TQ3FVAEP
         deD1bfceBn9zRQ62Td8zThPAx/2DJnxoUrCd0UcLwMXtSwutmO7tHNHcQhehCWGAvwRQ
         MwRQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qqIixAMkM9nzxsaD/O/d/ZcwCxDqLEqE9c++VpvkREwqEeLvwsvUwwRTR0kY1agZz5hIOOzo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt7TEoRr9U/TR0/uN7E/k1khkCt1VbVj+vUX5XI4OvLPeNPoSa
	NCt7hBGZY61bKtU8IM/0AAbOqqBBUgTCdM2o+boOsYqtVZQNzrWpePRta9KZ/jsWhoT/bePw7dL
	3TJIwvzyYiX1AlWN7s4kn3YQo0jOYsCgwB8Oh07K8MNS0VhquiqfrYOEOHh2weYfi
X-Gm-Gg: AeBDievZOc0XqPDO7AJ4bTxBNz3XnrQip7l0ivySBswC1VKTURq7cC5MGiXV2ZJkRD9
	gQr3LLyUyt2+uJvzFFDl5fhTbZlDnOPTAatPRcOCgq/Rc1V8D7NvrTTCeMABR7WKyGATd0THCya
	Y1Fb7v/mJNP+ZIIhQjuGTsIhNZ4q9adRzg/Ff5cPVtLSko/jFrrrZthPf0/4Jju28GKlQbL1kIc
	pWR8ojsKS6coSuK5/OUUVG4VNZr1b/ltJWKaBWeZk8GjzOejaRdQvxn8T5RiBqu0t7APu8HsVxQ
	iOqQ0RmTQ+ObITKU7GI3EXF79G0TopRTlIQcslKMlrRc8rMp4wjHdbCHAJSgk99ltysgvMPXRfM
	DELitPcO/g8MUV9zDuw5+J2XnKolwm9g5sOvEoDBl5hHGHnmX508ax2E321i/A9xPFZ6LzvJ8tU
	U4
X-Received: by 2002:a17:90b:3c45:b0:35d:a542:2dc0 with SMTP id 98e67ed59e1d1-3650cdb7d76mr14517262a91.8.1778001824968;
        Tue, 05 May 2026 10:23:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3c45:b0:35d:a542:2dc0 with SMTP id 98e67ed59e1d1-3650cdb7d76mr14517234a91.8.1778001824378;
        Tue, 05 May 2026 10:23:44 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.82.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bdf54203sm18802354a91.7.2026.05.05.10.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 10:23:43 -0700 (PDT)
Message-ID: <151425e9-564d-4d61-b37d-3eef9bc54b6f@oss.qualcomm.com>
Date: Tue, 5 May 2026 22:53:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath11k: fix error path leaks in some WMI calls
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260502071453.2379188-1-nico.escande@gmail.com>
 <20260502071453.2379188-3-nico.escande@gmail.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260502071453.2379188-3-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2NyBTYWx0ZWRfX1m41eC6zDOZX
 1dewI2ofiRsJtq0LBY4mQTMTfdp1SaTCVBOy2jUpjTAjfVd5R7j28ZxErvvAWE4oDtPV7XeuRjC
 MMgooPZJYthRhMqxnreIKq6xBkGYMHEGe8MGarISiVQA2RV5OtMckbJx0kavkdcdd++KwIsjT+g
 TlhZoHyHvD17e/SF7ym6FkYl862ImMZCvr2QXMGeGKxi9bWqJdQhvqpbIuD7wUwD47b67C11PZS
 BRA+qdEWhJXtzxgkQFPxMdimz2VU+YEsSPPKwU7IW3gqvzKr8wAfOMMHzg5GGQm3CMpxMAtlN8e
 cJfzUu5S97wh/RwyNqe+lv805Li1YJZqwmUWtc/jTw2qr4SGDPc4qwQOEVPnmTGNbdtfO93iznr
 bMDclKdjWaAosiOy2ToUpgLdkExbNeYZa+hXsSdmMJqeKCQbeZPCOkdJTDZYpkVX/lwO20XAcRK
 X0HfK0v84lOrvPJanlA==
X-Proofpoint-ORIG-GUID: uZ3dhF5gqJ_Hp-wKv06Q0j27SOB2puT_
X-Proofpoint-GUID: uZ3dhF5gqJ_Hp-wKv06Q0j27SOB2puT_
X-Authority-Analysis: v=2.4 cv=NPvlPU6g c=1 sm=1 tr=0 ts=69fa27a2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZCREz13nqshT/on6E9YcPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=TcU8LgJCOK-_YL1Lr1UA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_182350_665697_7E67DBA1 
X-CRM114-Status: GOOD (  19.03  )
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

On 5/2/2026 12:44 PM, Nicolas Escande wrote:
> This is the same pattern that was previously identified as problematic:
> direct 'return ath11k_wmi_cmd_send(...)' will leak the skb in the error
> path if it is not explicitly handled.
> 
> Fixes: c417b247ba04 ("ath11k: implement hardware data filter")
> Fixes: 9cbd7fc9be82 ("ath11k: support MAC address randomization in scan")
> Fixes: ba9177fcef21 ("ath11k: Add basic WoW functionalities")
> Fixes: fec4b898f369 ("ath11k: Add WoW net-detect functionality")
> Fixes: c3c36bfe998b ("ath11k: support ARP and NS offload")
> Fixes: a16d9b50cfba ("ath11k: support GTK rekey offload")
> Fixes: 652f69ed9c1b ("ath11k: Add support for SAR")
> Fixes: 0f84a156aa3b ("ath11k: Handle keepalive during WoWLAN suspend and resume")
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>   drivers/net/wireless/ath/ath11k/wmi.c | 112 ++++++++++++++++++++++----
>   1 file changed, 96 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index 024c2aad9fb4..dca6e011cc40 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -9299,7 +9299,7 @@ int ath11k_wmi_hw_data_filter_cmd(struct ath11k *ar, u32 vdev_id,
>   {
>   	struct wmi_hw_data_filter_cmd *cmd;
>   	struct sk_buff *skb;
> -	int len;
> +	int ret, len;
>   
>   	len = sizeof(*cmd);
>   	skb = ath11k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
> @@ -9324,7 +9324,13 @@ int ath11k_wmi_hw_data_filter_cmd(struct ath11k *ar, u32 vdev_id,
>   		   "hw data filter enable %d filter_bitmap 0x%x\n",
>   		   enable, filter_bitmap);
>   
> -	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_HW_DATA_FILTER_CMDID);
> +	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_HW_DATA_FILTER_CMDID);
> +	if (ret) {
> +		ath11k_warn(ar->ab, "failed to send WMI_HW_DATA_FILTER_CMDID\n");
> +		dev_kfree_skb(skb);
> +	}
> +
> +	return ret;
>   }
>

{ .. }


> @@ -10053,7 +10127,13 @@ int ath11k_wmi_sta_keepalive(struct ath11k *ar,
>   		   "sta keepalive vdev %d enabled %d method %d interval %d\n",
>   		   arg->vdev_id, arg->enabled, arg->method, arg->interval);
>   
> -	return ath11k_wmi_cmd_send(wmi, skb, WMI_STA_KEEPALIVE_CMDID);
> +	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_STA_KEEPALIVE_CMDID);
> +	if (ret) {
> +		ath11k_warn(ar->ab, "failed to send WMI_STA_KEEPALIVE_CMDID\n");
> +		dev_kfree_skb(skb);
> +	}
> +
> +	return ret;
>   }
>   
>   bool ath11k_wmi_supports_6ghz_cc_ext(struct ath11k *ar)


Thanks for fixing these. One more instance of the same pattern remains 
in ath11k_tm_cmd_wmi_ftm().

Please add dev_kfree_skb(skb) before goto out, matching 
ath11k_tm_cmd_wmi() above.

-- 
--
Ramesh


