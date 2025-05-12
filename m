Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91075C3ABCB
	for <ath11k@archiver.kernel.org>; Mon, 12 May 2025 18:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRuMbOu7z2/40CcYNv5ov6Lwj3aKCA6IW48Ap+X8VIk=; b=bwbAijEQGbmTqGfYQzdwDSy0oQ
	XbthUy2ZtZw1aib2deAPVXwEeCpT3jDmqVoBFez76q9eqFQlQCoIWxc33o5s2zmVcKV3M5jWHQBhM
	9HPCN3x+mUIR0/d6660ZDmo6drU4bI0OovLXeAxfK0DjA5/6h4BfitZGQe7RqXxm4gE3VA/tZwPqE
	AFd35fd5qnvaMLAtW3n38QAxI9GsuT/tWxAKbcxMQog7XZSDwSWoFHf18VsDV9ZxjFZA9ByVqPjii
	rK4veJ1BiiGMFkOnh7nNu+CWs8vc1ZLP9ys8EDYz1HSjaa5hVU/3iecRqG98KqEZZLwz0KZCX+cUR
	qIcV8dtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXx2-0000000AOq5-3igA;
	Mon, 12 May 2025 18:32:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXwN-0000000AOef-2LUm
	for ath11k@lists.infradead.org;
	Mon, 12 May 2025 18:31:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CIQlhI015454
	for <ath11k@lists.infradead.org>; Mon, 12 May 2025 18:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRuMbOu7z2/40CcYNv5ov6Lwj3aKCA6IW48Ap+X8VIk=; b=a7HEJnUjIcbIFQET
	juz7tJUh3/WhNf1fPEcyJFPjjgZmiqUA3CH3y3mTIL2uK/OwSwVEo+HJN4iCpxZH
	ngS/y54Dbgt78GebGwripBWnF6LrLtK//JggUFaEnHy4kK7tg5SwXx6J6BSxcp31
	PvkX7PCETCc0LaBFYZX1lOYlh+k9P+w99tY4GcEKxBp4f874QBS0U19/Dv1wzd89
	BI586r99xSsNLwkhB2NSxUghfqkY9GGmEcAzNEcBL3u+ga/Eq70EyGPYmcfMfMIG
	bvY6WvF/ZOHHpO8yNDw6V788xB8EHVuug54ynv5LpCCd1N0DSvxAj4x0ctmkGncO
	KF54zg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hwt959y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 12 May 2025 18:31:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7425efba1a3so1389921b3a.0
        for <ath11k@lists.infradead.org>; Mon, 12 May 2025 11:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074704; x=1747679504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRuMbOu7z2/40CcYNv5ov6Lwj3aKCA6IW48Ap+X8VIk=;
        b=ib6S6BR6eXdBWlg1+qJo5SYypoX1zzc8RtphiFkAkJ1noVBEbX3ACbkWlp8Jj36odE
         NV1QZ4N6ycNvJRZGCcJOM9RVXvNKKXHoL6Qo2/m8Sk/isBcCV8csIWP+8Q1LwzFONT4b
         YBASWAFV4/vFaWjx67BXiHSpUCWY08IH7ah9wp2faWww55HeS0wJREzOn3Yw0XrfwR3e
         UvucvxH5t0KB+kIA3a/FZEsa8UGHMyJ6FgRizQ2AH7GXGuFU7w6FgQj34RxVVWg8cVmF
         LCMjIkelHV/LAW05AUfr71jEiwwlkwMA+H02UEocSEwhu4TIADD49NrbbRwVPw4yv8bi
         suqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDbu6/Z9rQwOnDWZTbfGrypgafYJCHUBNoRYcQeE2gKfRUOfoPNymU0X6VTls371hptXuG0zE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9tby7XGk2r3a/OcWZSJ0chQSs1r6c7wQW9ydmzKZdVc6kbKY0
	jNIeiPKElNXY3xDY9IQsjwTlTsgFVKaFAHfOoqAK9JyaZwk0+oTVOjqss5z7ZZkhGb1sEHyrWLs
	LVxlEaebk1UQE72rIEkJo8oY9bCddsR/v/jC/4u4yvE8l5cmJ4hx5PIUdl2tA
X-Gm-Gg: ASbGnctUrjHEuSOPjvjUOLIdRpr0MBGPW9uBX05uRffJeQlLmt3hbqU/C6lUyvo8Xnq
	XRL9E6A445wfIjoj9BgFKX2cCX7xk1LvLrHK8hiw+xuavvkUOlHEErEbErFiTKqKJo09jRMPHeM
	nl34RMxfp1JifBXrpA201beD9z5KAM9AGrAn9oI3JhjMSXBjUM74DickDzEJWCySOrJEv3csDOh
	XsnCbresZs71dEthJIGm8x/I1MADOP4VJn0BttXXTiRcWuwyHVc1YK0ZAkiQ4BHY6Sjrt0yya+Z
	060sqlRtqLo3B++WlV49TImu0RLPwXj1+6xSXmDXo2bmkRSUeXy+XPnoOmjvHg==
X-Received: by 2002:aa7:8810:0:b0:732:5875:eb95 with SMTP id d2e1a72fcca58-74278fc0601mr661854b3a.4.1747074704416;
        Mon, 12 May 2025 11:31:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOwALx8DJD5hEqL5IewreE7joV43KAgJapB12TnNBFDt3caeElexu9Ss50kxC3I4FWD2MAWw==
X-Received: by 2002:aa7:8810:0:b0:732:5875:eb95 with SMTP id d2e1a72fcca58-74278fc0601mr661818b3a.4.1747074703928;
        Mon, 12 May 2025 11:31:43 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a3d0fesm6443104b3a.130.2025.05.12.11.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 11:31:43 -0700 (PDT)
Message-ID: <d97c900d-c899-4f2c-821b-53991ecfd86e@oss.qualcomm.com>
Date: Mon, 12 May 2025 12:31:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: host: Allocate entire MHI control config
 once
To: Baochen Qiang <quic_bqiang@quicinc.com>, quic_carlv@quicinc.com,
        quic_thanson@quicinc.com, manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        ath11k@lists.infradead.org, jjohnson@kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
References: <20250425170431.921656-1-jeff.hugo@oss.qualcomm.com>
 <1f2a8c11-214b-43c6-8b3a-9e44094f949a@quicinc.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <1f2a8c11-214b-43c6-8b3a-9e44094f949a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE5MSBTYWx0ZWRfX0U6Sg2BMcryD
 H6KHMN6F/pUyUCK6EHvuaNdc/N3qezUEDqTDT7SeaG68NclQHB9tmYR33GZJHr1q3GDQDOw6RPi
 SVqJdD2bcYjjTRtv8uRp93EoZI8FZpguDhP+fsdnpdCgzYnUtsMHgqtyiaTgfphko0iuR0BvSWG
 PlxWmERD909X88lth87j3mknH/5RY3EbEQaaNVvnPTu8FKlhJC6bweT9jiTlXU9bOET234HtTNH
 WYoTmBPnFduT6a1T6Qcx9j7E/UrXYlmbPCJXNzJX19asUQgE4vHE3LvY5H15Y71WVc1t8ADydMo
 8r/3/IMGndUUs5iru8pYzcPLt8rGOXbFKBghC1+ILdQ0hClPfVEM040Y5+kPZ3dYusfKvgBiIzu
 lgOAiO8LqEGWVVlJB2gpRBh8He1OZfwezh3IcKFwpZqh6FiVUtRG0X+1AYEZwZJ0aT4U9/FA
X-Proofpoint-ORIG-GUID: q3Aafx9i6vPGrhYxAilS5R15GQAJugql
X-Proofpoint-GUID: q3Aafx9i6vPGrhYxAilS5R15GQAJugql
X-Authority-Analysis: v=2.4 cv=a58w9VSF c=1 sm=1 tr=0 ts=68223e94 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=wuHSmCbw7zfmQf2vPMgA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_113151_741787_F99EC4EA 
X-CRM114-Status: GOOD (  10.54  )
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

On 4/27/2025 7:57 PM, Baochen Qiang wrote:
> 
> 
> On 4/26/2025 1:04 AM, Jeff Hugo wrote:
>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>   int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>> @@ -475,6 +497,7 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>   	struct mhi_event *mhi_event;
>>   	void __iomem *base = mhi_cntrl->regs;
>>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> +	dma_addr_t mhi_ctrl_limit = mhi_cntrl->ctrl_config_dma + mhi_cntrl->ctrl_config_size - 1;
> 
> but the range [ctrl_config_dma, mhi_ctrl_limit] could still be possbile to cross the 4GB
> boundary, no?

Its possible, yes.  From a practical standpoint, that seems to be 
unlikely as the control area is not terribly large on supported platforms.

