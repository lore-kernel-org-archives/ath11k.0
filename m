Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F542C54F54
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYiR2iLP4+ZiVlUT4zCyYs7qkRlob5qlCbALPuCDTPI=; b=fXL+mTIeaBeIZvDKNsETMIImC5
	0KOirh2aF6AGjRzCkElurJgiQO1bIdBLP7tnXGAwGNn9eKiOLfAiDZiMcDd7ELzFmnaP5lUtNx9VT
	7wJMhRR2Iwq8VaIJgQPFeqok5WnTkeLtoKEF1xnEt3D7/N2lTp37HEmstfovzvC46r3sQ3FqtyG9n
	USLzX/WV6MYqm7oHri59y51SwqTwrh32UcaPGP7Mjsv/wwGFKmenm9lqW/vK1fzHvqT4AdVUs9Ddh
	72VNGpj9ywFtAqNYBBbFKr6Y6d3YWtIoMJ+cvF3Y4N4kjpAa4YRgOdF+rASbEJsOXtNI6v0c6VyXn
	Ob8Jyl8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq9G-0000000D8ba-0rIn;
	Fri, 31 Jul 2026 16:31:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq9A-0000000D8ZN-0s0Y
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 16:31:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOGfR071142
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 16:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uYiR2iLP4+ZiVlUT4zCyYs7qkRlob5qlCbALPuCDTPI=; b=ZJWDC9AeWjvcI1Ti
	BS79eDWsz09sJ0c3vajJ12Nzp2II/6TaF6GmUJBLwpGFDRTtTQL4KNHse8jAe3SC
	xY6Y7WSquBGvXy/umWPdbhHvzTvMTqaGmKoQDhsHu8lykrYu5SwRVKGmf3ozQprU
	Ik/2a4wZzfFs4hkHRRFXyd9whlMFBP8abXAO9lb12GL2oYBUysru5CefIF58UDLo
	WFlotEyqaZbjrc8/lHTUGCpfuZL6asAGEFpTXl4W6k8zn7lwMovx61urc7f3OurR
	NuMw7kzcVpl7ciWbFkK8n/34jHlpZlXW/6dKGvHwGz2mlWq+wsh8+6aUvUzysVQT
	nDhj7g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtyqhap2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 16:31:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so1063393a91.2
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 09:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785515502; x=1786120302; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uYiR2iLP4+ZiVlUT4zCyYs7qkRlob5qlCbALPuCDTPI=;
        b=L8BnQURx4GzD7GPdOavLM1LYwwPc4UfZ+7PhJFY+bWiq2NnegNamAR6KtcsOXD9/LY
         5SQyXS2ybvgejCJsErvMMeHiVv8IpE4hfR3pt9nHbInbWMXufEblbK/AdD3ICbiw+Hjw
         nA34XSUO188bOF4x0R4FWwc633UmIOg17Fkh+ypTkvTL+ETg3iSKYJC4nMNCbTAAaxAY
         yo3/PwEFPMDNiJu+gESu7LIv5HQ1hImgVqOTzLlFis8hThYjGU8bY+KbdI7JWmv30QiM
         Udqr+BntUP7TLQI28B8w/lYvxD1gxzKjhgbbLAckISDNTh6iBL0/xYGNs6/30iw+GWn6
         L0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515502; x=1786120302;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYiR2iLP4+ZiVlUT4zCyYs7qkRlob5qlCbALPuCDTPI=;
        b=PkFYOt9h38hIpHw7w4kRbM95wjgOIN8QhFOASTss74tRsBQwGxABEE/WcacffEUmjn
         aj8gQ/QBkh0fKVvN3kd7Ih4gJtCumGDt7MfQPGvv/wbTqoSBsuVYRg5L2m4KdLPFZX3b
         ytoaQvBHopGcQWlDXau160SC1qxBIhm7XMfzpVN7ubGt5wGiW/wR4vSWh4Zi78wojJ1S
         7sOZJTZdKHtma1D7coonrX5V4XZk9DSTgnrKW33PkMs19quCYEsUxqKGuC4zwW4XTgbm
         ZszVAi4JNOrUu+tAP9x6GR/9ae4cFL/2g4IGy/Fx+9FAcGhftpUY78MjjqZz/H/oz36K
         fyQQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVtSk4NmpCww7gxh8Sjs8MrqdgBw76j6U/4rJP/mS3yBenL41vldjkiRfnBBFbkTgaZEGXp3Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpGEtallFcC3ZMWSNrMw691j1TjqYGEryuyY3qiuV7PWYjOkMm
	IPFNQUUKgIv9SsHtpBxJgDlioYypv19w+cJU4ckzqYh/4PIVIFJkwNIKl6O3N/NQI+wFHfK0jsZ
	wF00Y7iapW1K9n1mIIYtfJEnvga60imVDHWoKpz9j3CjEHTisIigzASo6NbStf6M0
X-Gm-Gg: AR+sD11+pzO+ZgRh5v4aP3vqtro7IbDCFh632BpNCz9evTNfWGW+jsJ6cfocvnpWrXD
	+N39CkJqdR82dPtu4MChBOwurBkV+SrUpaHh+PVUnxPeh4WxOBkcLnN4OaZjRkY53oq5aOoztQf
	ukTdAJmFH3hL1dhcx9AgZHCBBLNivuSQZ8Vd+HaclA4nYKbnz4LfHTxfBDGRjzTvGXKuM+SepHW
	dUd/G2kbWm33RvKhS7KJpehgG7orGu48Dz6Hag1U4i3VTHo5k/BlO52nozRY2Ebt/PqtLipek1C
	7Kk0zOXrcKNuUq2+mfK9ahJ06BbXmbKO/4I/pTvNpSB+XFpnZHclEMy6mHfNfMX9q7XLAOQz6HH
	w848X/Ov0R9Z7sc6GekbzsfVJJaj3SjRxR7PODQXIbj5DZArp5jtl1DBLKBlz
X-Received: by 2002:a17:90b:3850:b0:38f:5869:387a with SMTP id 98e67ed59e1d1-38fbc3f24bemr435699a91.8.1785515501967;
        Fri, 31 Jul 2026 09:31:41 -0700 (PDT)
X-Received: by 2002:a17:90b:3850:b0:38f:5869:387a with SMTP id 98e67ed59e1d1-38fbc3f24bemr435678a91.8.1785515501465;
        Fri, 31 Jul 2026 09:31:41 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e70esm14849573eec.29.2026.07.31.09.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 09:31:40 -0700 (PDT)
Message-ID: <6b7c217f-375f-4126-8f99-44e2a36f9b12@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 09:31:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath11k: fix locking problem in
 ath11k_dp_rx_tid_del_func()
To: Nicolas Escande <nico.escande@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Maxime Bizon <mbizon@freebox.fr>
References: <20260729085741.3485711-1-nico.escande@gmail.com>
 <387b4bb6-b0e4-471a-9276-211ecdedb58e@oss.qualcomm.com>
 <DKCTYSL53MB6.16YGGTQW1BGDC@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DKCTYSL53MB6.16YGGTQW1BGDC@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyNSBTYWx0ZWRfX2Wq1nF4yHjM5
 sn9YsHpKY6pheFNlr0cZwCvuS5d2HkTBX7zSYMrxz1qHpPARvbK3TraPXivQM+9G8JA4BmV8rGr
 5YkbbjLcbJapmaWS6KkVrT7Kqe3ZZuBRXi/rRaLhRE0qW0Rh4U31LKea3VAkC5D64/hTrcSU/Fi
 2hRJSOwMqlj2FdMqSEHZbq4N+yuqgk4gGNYaKBU/9wkhVHR1miwc9S7eFQrDqi3V8gZGASMy6bx
 5z9g0/gVv18J/ku5cOmKXL7/YgWqZ+5aCBByC3Ly2PAfh5hVLtqyVPZPb9i06UURJdhdE4QSq3J
 PRvPiE63eaq2xMgMmBkA8mvnoDS2KzNobshHov/5Fwnz7v8HNOkjc+OGHNzLCE5mQ9BrbDDEz17
 KrA0cIF4OKPppqP3AeSuhk0wV+0ZP61Jr/H0lc6+kNoVvjwMGR/DUWsir6qSuqesqZZsOBde8UQ
 iytBA8R6hCEse72Ogsg==
X-Proofpoint-ORIG-GUID: IBRJ6VpNtJMeLl9dTVt_o96hmVa0eOEQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyNSBTYWx0ZWRfXxwbFDQ50iK0V
 nBAXe1e6x0bdi5Y5C+arfFK69NUx28vzYll49LjA/bA/vwt0Q2CNELd+CpHvcMm1D0vL3N/Etuz
 TCZt2khl+AUolHKR+IMiGewFo8CqcLU=
X-Authority-Analysis: v=2.4 cv=YaGNIQRf c=1 sm=1 tr=0 ts=6a6ccdef cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=AoP2NEjCippIi4usPyoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: IBRJ6VpNtJMeLl9dTVt_o96hmVa0eOEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_093144_726949_4C381601 
X-CRM114-Status: GOOD (  20.86  )
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

On 7/31/2026 7:36 AM, Nicolas Escande wrote:
> On Fri Jul 31, 2026 at 8:49 AM CEST, Baochen Qiang wrote:
>> On 7/29/2026 4:57 PM, Nicolas Escande wrote:
>>
>> while this seems the minimal fix which stable team might prefer, how about refactoring as
>> firstly detaching all the expired entries onto a local list under the lock and flushing
>> that list afterwards:
>>
>>   LIST_HEAD(flush_list);
>>
>>   spin_lock_bh(&dp->reo_cmd_lock);
>>   list_for_each_entry_safe(elem, tmp, &dp->reo_cmd_cache_flush_list, list) {
>>         if () {
>>                 list_move_tail(&elem->list, &flush_list);
>>         }
>>   }
>>   spin_unlock_bh(&dp->reo_cmd_lock);
>>
>>   list_for_each_entry_safe(elem, tmp, &flush_list, list) {
>>         list_del(&elem->list);
>>         ath11k_dp_reo_cache_flush(ab, &elem->data);
>>         kfree(elem);
>>   }
>>
>> This fully decouples the concurrency from the flushing: the detach phase runs entirely
>> under the lock, and the flush phase walks a thread-private list where no concurrency
>> exists. It's a single O(N) pass instead of the O(N^2) worst case of re-scanning from the
>> head, and it avoids bouncing reo_cmd_lock once per freed entry.
>>
>> Also this seems simpler and more direct — its correctness is obvious by construction;
>> while the fix of this patch is less self-evident: a reader may not easily grasp why the
>> code has to rescan from the head after re-taking the lock.
>>
>> Non-blocking though — either form fixes the crash. If you'd rather keep the minimal goto
>> retry for the stable backport and do the detach-list version as a follow-up cleanup, that
>> works for me too.
> 
> Yes I remember that we fixed it this way with Maxime to minimize code change.
> But doing it your way seems to be the better thing to do. So I agree I'll
> rework this wit the single iteration under lock + cleanup pass.
> But it will take me some time to do so, I do not have much time right now. 
> So if Jeff prefers taking this one as is just to have a quick fix no objection
> either, I'll rework it later for next. You guys tell me what you prefer.

Let's rework to use the local list. We have that pattern elsewhere as well.

/jeff



