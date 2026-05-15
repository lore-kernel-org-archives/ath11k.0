Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A36CD343F
	for <ath11k@archiver.kernel.org>; Fri, 15 May 2026 06:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaiA6uNOJPCPDvEvr38gVo7es41f1RVtqIB66QY5CDQ=; b=FrglmvKeLX8apuyTz49gde1QD7
	rWu8Dg1QUVl7FQSP/Bgg85H+cyyMipGRP3T5poKPj22kD7eLohd4a1KNsNlzuSgLShaStRk3mZibE
	rCZK1KEfCnzcKmHvrvs/zTyzNG1Ou6N8oRvFdyjdXERumy6i1cQ+plODt9mp72TezlyVQw6m8mR1Q
	alR+Hvs969/HM5UoXOJSw7OJgtKeKz/F3Vf7RkPQuhDuQeGUfnouwPRznQe03DBIiM+1hxpncsgfF
	5eFDmG5xlMmUhKUKFaAmDN9YE9eY1MZUFnnphySHP6lDM0QHQQK0QO9ZgnDP1f4uZ3+X/DGguwmQo
	zoFRMzHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmDd-00000007Ws9-3xSN;
	Fri, 15 May 2026 06:40:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmDb-00000007WrM-3JAv
	for ath11k@lists.infradead.org;
	Fri, 15 May 2026 06:40:21 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5JYl02676441
	for <ath11k@lists.infradead.org>; Fri, 15 May 2026 06:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GaiA6uNOJPCPDvEvr38gVo7es41f1RVtqIB66QY5CDQ=; b=Gh5kY4thgyjLnnH5
	u7sikvnlHnCPBmEf9Dzyskw9qwVVuDlL956K/pD6UBldN3c2UMhw46RrshvPqLkJ
	iNQbPhF+q4HZDOs3hUljWAXpTdnb1lcxW+1Sj3UdB8JUHrrKWLl8RDvUWJZRR+Z5
	xfX+IQnXHH7k58LvIbvnuhGjjeKkMLQVawn7eFm8pOGtABKIBc43C0F7FDp0K1cd
	AddqmGdJwJpWh17TlpgvnN3j/m0fsrGTE6lucJx+W0dp4+jwIUbsSQt1yW1rRjnq
	l5O+3wO4IcFOcwsRzZxT+N6fBhU/g2Zw+HWZJezY//dQ5IRfFEhhn1NMdwhqyPUm
	VPD5Vw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vsy8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 15 May 2026 06:40:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-837d43e9ff3so6551981b3a.2
        for <ath11k@lists.infradead.org>; Thu, 14 May 2026 23:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778827219; x=1779432019; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GaiA6uNOJPCPDvEvr38gVo7es41f1RVtqIB66QY5CDQ=;
        b=TeIoogOigCIri8yUXD4lcp/tHTLgByNx4nfeFTnbHcX4I53D8Un2Blo/RkH3j8VymY
         f1k0/QxIzowedlv3c4YwudH2G0Y+N42+Fqe7OFJjJ3sLUzWEXpEA6iOawpqdN68burdf
         Ybfr9bfLWDuP6m9DZIDbcBhamtGc3sgj5edmT/y96At9U6A9xPp5B8+l0o5h07c9qVHN
         bxkydModjaFeNuwcM2Dlu0sNG7CtBFCMmGz9g0IoUkFbfwDCgylHr0cZQVj/+r/MuTl0
         IHv/7huBbW1lOYYpIp8d5kbQmfkMhtjTE/h0B64v22em7vcL0JoSdLGtEi4G0a/HpgBv
         xVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778827219; x=1779432019;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaiA6uNOJPCPDvEvr38gVo7es41f1RVtqIB66QY5CDQ=;
        b=VpQ3fxKWmyGKiebjqWCVyvy5eJAHddT/w6Ady/bjlcDIyw4dlT+f4k8TphebXlPxs8
         Wz/xqS9BkZGrR1lXkLpfZnf+nRF/ATRc9l2mekynzQoNVkCN9aXxHHwpeGLCfolAGYEZ
         9GqS/sy1D1FnIYUV8SQc03senL/7PB/ZUHhVva/obfMdJnuhOLPBMEcJksUvQO4LTjk5
         4gkUEcz59SXPnmlOTtjZcyFpiQSZDHUIgC1IclygqshRuZ4mNoy/DE9rRGrmfzdpHtzK
         hynHOwedN8XCNKw1BWLdOhLHI/2OslODcGibUBTK2vt3N2LV7Mock5/qieBOs9XSQm0v
         mUAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Z6NUQEli9Rw1AUSrny/CLDkW+k5OuGn2VLnlJ8JMKVqBGjxfs5oRrNWvX9FiEnLdQiLgz2ME=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxiryf/uwhhxC+AyG0Bn5Z++dNuZufeZAeRUhyTD0RtyI15pvzd
	1OJkN/+3yKl137NlYw9GAgc0OWxcCHDjJpvbHwnbDGe8aAbNF2zGn0Tmh5udPL/DqBRwPPpc1R3
	ppxblaqS0AUgCzEuFszQtvbjkTB5PROihw8Onl83VxkPf1CubfqXEwbheRBK9y2qN
X-Gm-Gg: Acq92OHXQrQtfjRriLgc9Bq34HVRNw5KszQGoO1UIM8v0zUHdRicPU9y2WurSU4/apR
	hL3wz67K7E+gLviap6NnInVO5J1s5XfkttOkckAfMj9x/ayFXUAe00pU3UKJTBRq9xHLBuac3m/
	AwbAqnSNKbjwAhLl3aLF7GIGSb0T4feRgl6kuCSQExAyXS6W22Yb/6zxX0jSkaXks9bC1wBOWjS
	vtPqd5Hum4Leg/irLE0cUQC/PSAIgaeL9V+3Ge/S9GdsUsFNUlaF/J8K6D/+sHX4MiwoJsHfomW
	lhH8EgLbXwpgQmDJcCRRtKs6zpHxWPuyT32JLilQ48e55jQGtxi7Ya4GEZuDB4V+h8eUeQwQETU
	WYsLOrqU6vMVLeMbPN+bc6eU0T808tMSoghrOywBaMOp3xk7mCObryLs8BHOAH0bZiyd7xOei3j
	AvvAUJ52AWkwue9AZIyw==
X-Received: by 2002:a05:6a00:32cd:b0:83f:250d:5ab with SMTP id d2e1a72fcca58-83f33bc8888mr3191655b3a.7.1778827218609;
        Thu, 14 May 2026 23:40:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:32cd:b0:83f:250d:5ab with SMTP id d2e1a72fcca58-83f33bc8888mr3191629b3a.7.1778827218116;
        Thu, 14 May 2026 23:40:18 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1979a0b2sm4965276b3a.26.2026.05.14.23.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 23:40:17 -0700 (PDT)
Message-ID: <a587a83a-8b72-4e93-8050-654932cdffea@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:40:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix warning when unbinding
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260420110130.509670-1-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260420110130.509670-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a06bfd3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=qhnAyV4-s4WfS2nNwg8A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA2NCBTYWx0ZWRfX5g3u7WObY5j/
 ZfLf1PpiPLm9NtxsSiE0fBKgBnuIKuQStrBdV8dVyuL/+KQeiUHxPHejoqPO9Tx3vSlNzo0ATEn
 NDDELWBcnCipJ/zyCtKZs1nqG7Wbk+rBC0Zyj+cu2/8PAcEputNIVCYD3lOD8mYxjcCTVw0SgAk
 xu/xNdAxYUXvXJSN+9r81XWjP2I1yT8chwLHEE4OBrtrKl1TC9W1WipcB3S8wAhxEQJ7zRnNrDR
 ZNYemUDTH6Y0xGKZa6srevxrbYd42i//0l3cgGpy/Piw2NFGTDcUhcjcxhGKJx915P6Ll0+eUjr
 cGZ9t7d+o9PSB3cu6KDot3HLzVwWmyJ+Nw1EWl/6tmaeHoxj2Cfs2L/qfcdOaCf4m/HTrGt2Xnp
 f08CiRGhQWXc30zDEFocPrZc6lkZ13wDJcO57vyE/tge1CUNQvo3OdEcemNXKwAuUWG7LEcG6tI
 YDdBG+UyFvtlL78bx9w==
X-Proofpoint-ORIG-GUID: dnzpI1uCsVn2umN_S6AfNBElaLXubDbM
X-Proofpoint-GUID: dnzpI1uCsVn2umN_S6AfNBElaLXubDbM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_234019_832722_6F9EBEA0 
X-CRM114-Status: GOOD (  12.24  )
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



On 4/20/2026 7:01 PM, Jose Ignacio Tornos Martinez wrote:
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

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


