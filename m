Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DB1CA0EE8
	for <ath11k@archiver.kernel.org>; Wed, 17 Sep 2025 03:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cep67SnTfnADXcOmFM0wZ+47pVbXaqSC/dRePINIa3M=; b=k4lllUto8AH17TSKZq+LPn5rOH
	5pqw5JqYoSJL8hu5x2Boz+YQLtwEhay/CGzgNyOQMBxK6wKQ+EyjHPBR2AA96LjxLUz7KSbZJu/5i
	n2niQq218yExQdoCiYMnSjd9I5CIwApwvCGFu6sFVvv9d1RPeTxZT+yeOfOZ/EFj3YmI9hUTP+vM3
	utIuaiykbWNbxy+ufpQ0r6wKlagIu0d6OA/pZs1hISPHL6IEso6c5BxZEk243bEzkKKh8uOBQ9YVw
	WgLghwRj3buYUD9S/ITa2Lusvdvf02SFmQFw1Wc0821j+857LkN57nSsBda/GZJRKJsektCU4nmOw
	bgb1na3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyjEm-0000000A7FA-31D3;
	Wed, 17 Sep 2025 03:53:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyjEk-0000000A7EZ-36j1
	for ath11k@lists.infradead.org;
	Wed, 17 Sep 2025 03:53:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLZqF5010273
	for <ath11k@lists.infradead.org>; Wed, 17 Sep 2025 03:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cep67SnTfnADXcOmFM0wZ+47pVbXaqSC/dRePINIa3M=; b=DQ5IYe8zCWBQgkrP
	1OkP6M8IejcEYdrmuxaD90k7mzkhy2nbk7OW4h5jYcV35u8THXsUcrHMDNddolsl
	de8DbAQcEQX/q6SENMcb0zZuXxgV/4DOxNJxJbcC3DqD5+Qbyfk2Prw0RwVCv+K1
	kJ03hsNB3VKm20eR8LIRMTOUy4RYkslF8lUrZxdEiVypg3bCB2EreZFI+kaalfmw
	Fzkl5nZd8pVLPflxYWhgzySvVRuBK1Cpx1UnBwpWJ5eEUG1x30n/VCpHJrUCS+5N
	6dCYy1KYeI8UVXMpqCIc4WRuE88GxINAgRtoyS5g5Xc3iUD2AsoyRXrp5OrtnDKD
	gJDP6g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxw8tdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 17 Sep 2025 03:53:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32ecab3865dso1031736a91.1
        for <ath11k@lists.infradead.org>; Tue, 16 Sep 2025 20:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758081221; x=1758686021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cep67SnTfnADXcOmFM0wZ+47pVbXaqSC/dRePINIa3M=;
        b=F3/TcBpg4PcZFQHcrRDatYv3L11/ppxtkFCAt0uSCNHrkNBKi/aBCaISPQyBxijVpS
         Vxk3XdnY2ZIejHejd+Dj9WeKieDkvOarbEM3hu1O1Dfer9oiz0KhR3VMNL6YO0MyjdAy
         Ld1pykWEUI64aS3xlfqndbhk1D9Ol+7cmkmImLg5GBS7e6WWvaPkjzQKnUJQj2SYK6oG
         aYAk5CXcqOV31/a/D7NnEo4bV+tcf1nsEo7JLf3Wc4lPoEY+tDtCNowgCGOUvNRzGyDF
         4MNvxn7mlt+p8uWZkHBzzFBK7PWh5z1kYXM0rt5JNgRntbOrZOAjDV3VqKsn4Yn7wxd5
         brDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgnv/Lr8QIbkH6sBRoZBpJ6QCuR7WEjVcUFjhtNzWYkIH3Z3fmHci9rZ0K78gTTE1oJhWfMwU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxR9HD2IVhR9pNUFQCRYLu7B3JaaMCGzW/dTDT40M10czbTVdeO
	K3L+jMM3ZiLakcyBchTERWEi2DA9TTsVrjUa2NEDin7d9oynuwv/uMAB9ySbugVDV3QAuCH63Gv
	wmOGCE2tGz2oiriioZ3GeZ1Irrs8UMt9ZpNBLmzsDVhR5lcbrOxoFnV+Wow5DTh5g
X-Gm-Gg: ASbGncvdZLcDoa6EckEBpwfEVhYKfBeTSMUs1+9R8f3tL1/tx1pNyLGiZfkJPyGZ2gA
	5ofUky8R5In6u9DoXDd5T4b1WZbkDReegaD6PLX3jgZb5oTJsjYjpZA3LLT4UiTigEvLeNJY5hE
	oBTz7iBp91FnZDLh5Cm9C+g7Cc377Luj7FTwgXKusnzedT36QoMjFC3EWhl1VMOwFrq0vMOJ2nF
	iJoSNrJh/I0aVq+ttD66mBzW1B6/7J/ro7uOHsx8shogpo3ovLbtKhiy9ECn+hi01BQ05HZeY55
	Xy4eF2mvjPAFPBJvQ65UjYx2YDSjqT1xPUi+fVp6GJKRhm8GC12pW3eqLSvvyI0AyLvFb+34mmB
	31iLzmhLNTz0=
X-Received: by 2002:a17:90b:5348:b0:32e:d011:ea1c with SMTP id 98e67ed59e1d1-32ee3eefe77mr975458a91.15.1758081221372;
        Tue, 16 Sep 2025 20:53:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhkw0YdOtL29ExmK2v3LOWKcGCk1jKtiEcNh06EUhootqyd/kiRmyV7nVn1zQ6nwDbzwHsFg==
X-Received: by 2002:a17:90b:5348:b0:32e:d011:ea1c with SMTP id 98e67ed59e1d1-32ee3eefe77mr975422a91.15.1758081220864;
        Tue, 16 Sep 2025 20:53:40 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.98.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed27724c9sm985762a91.27.2025.09.16.20.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 20:53:40 -0700 (PDT)
Message-ID: <a5778370-d889-fb9d-0ce5-498342bbfb2d@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 09:23:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 0/3] wifi: ath: downgrade logging level for CE
 buffer enqueue failure
Content-Language: en-US
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        ath12k@lists.infradead.org
References: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-0-f955ddc3ba7a@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-0-f955ddc3ba7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68ca30c6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=r0KOKur2OvuaYElxfjaavw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=TpeBPK0GJKfZ0rfD3RcA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXxOFeGL+VwwSZ
 5ZPhLf5wMpXU4ntKKw6fzHHgVR/2ZHIcnwJmLfL+gCD+T6DuHg6ZTH6xlh3AYqM4d8hMbN8AsSI
 a5+zYRGBukybQqEEp7NrIoYK5FdlRknZTQrfo8OINkXSlvUEkvdXzZxUi0jJ3iBmf14cl4yA5ug
 pf+NKzReVExmPOQC5K5PH7xUVpZmG2PGwLdZAbdcZVY/fj2lXfV94g241p1k1UE1kv06Komcadq
 Aa7Fc0veAxoHc43KYVxuetVXzcDKba2Uo7T6XrEtb3F21JCX73g1bj7FXFDCnqz2SvZlbtjWweA
 Yh19S5YmGqEisEUWBd9aXXV5NPnJo1Bhf5VrTI8YMTf+7uoP7pZHIuPPSSxvpLDv6r4vwVC8Avy
 i/b2mB+3
X-Proofpoint-GUID: BpMBvnZ7hODkyc3Or8g0uhd6BBKgntij
X-Proofpoint-ORIG-GUID: BpMBvnZ7hODkyc3Or8g0uhd6BBKgntij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_205342_793027_7C5B0ABD 
X-CRM114-Status: GOOD (  11.02  )
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



On 8/15/2025 7:14 AM, Baochen Qiang wrote:
> The CE buffer enqueue failure won't cause any functional issue, downgrade
> logging level to avoid misleading.
> 
> Also fix an incorrect debug ID usage for CE.
> 
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
> Baochen Qiang (3):
>        wifi: ath11k: downgrade log level for CE buffer enqueue failure
>        wifi: ath12k: fix wrong logging ID used for CE
>        wifi: ath12k: downgrade log level for CE buffer enqueue failure
> 
>   drivers/net/wireless/ath/ath11k/ce.c    | 3 ++-
>   drivers/net/wireless/ath/ath12k/ce.c    | 5 +++--
>   drivers/net/wireless/ath/ath12k/debug.h | 1 +
>   3 files changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

