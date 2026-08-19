Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93692C5DF86
	for <ath11k@archiver.kernel.org>; Wed, 19 Aug 2026 11:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4rGRVXIFEkP/eFGaEOLoP/WZecNrB0d3SfXEBkRIEA=; b=lO7sMwb3E1TCp2vRt7Jl87hMPh
	wmh+CKK+4m8YrYdFRaaEYKSGK979bG3O6Okfx5AxGROzaR2rJ9lbTgNqz3jqyFSbaSIK5kxhAVGiN
	3EGNScaznwVXyTEro4ppTjfWr42nm0WL9+9qdm+L9VArztmEJA+Q2+/caMF03NbR5Z7W/3rpRJy2S
	o8YpDJr6+RAppidpyHDn4MS5iPUFuBF96a+kwBZdHmPmEXEVdE1XZ4u0ZkKCfSkWy2MVFGuDyYZzy
	OfqdsNXqmMADsJ7IvNEemnNy1aCSkLdh2mIpTjK2u9uLIreEOWsdXPlNfIcUUPoakFKM/FvX7u4j5
	z2n4B+yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwe5F-00000009bwA-2XUa;
	Wed, 19 Aug 2026 11:03:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwe5B-00000009bvh-0naE
	for ath11k@lists.infradead.org;
	Wed, 19 Aug 2026 11:03:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7aQo3660873
	for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 11:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p4rGRVXIFEkP/eFGaEOLoP/WZecNrB0d3SfXEBkRIEA=; b=T3bhPkxlKYaFrpoR
	XxRnFXfG8v/FBPQaMhlKed2BwcNmT6vQqpkh7qJJY7FkF5465nW5u/0Y1PrvHGdS
	wbk6Y5osJyXrtsF261EQQAqs7MinIA6lq3n571NHwNaGYCaLXPLYZeIg45JOO+OF
	VeaxKySZa9mkUPf6bIS5r6Llu3MbKbi5dP02Z7+NzUOj/e9NhAf55xrsDE3Pm6gK
	aS8/z7bmMZsWY1XW5kw7tL2l1dt5zbWhdPD7hzzTdy88aj/FkdcqDPR5uqt6gMzb
	c8927nZqGcIZRwiBxopGXh28a+eWtb9rmf2cE7gFjMMuY3AZ2+v1uJ6yZpegX1Rt
	bi1K3g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkjw34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 11:03:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d5d00fd19bso15504255ad.1
        for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 04:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787137424; x=1787742224; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p4rGRVXIFEkP/eFGaEOLoP/WZecNrB0d3SfXEBkRIEA=;
        b=F5s8e7wLHaev5Wl6kZ+X019uXJTnWJYQEKtO3RiELMDhkNSzOzglIHIs1jm02IBs9C
         rh03Vn5RHWHu7K4+9fY+OYliY1hmQRMQKLbwjfb0KE2470ygLXwdclz2rK9aU1G/JfGL
         EslOhtmCs3jilwrka64O2aRfiKjrOahJo42gYsQ/84r8OIxtPHiBfwIIxtDMG3eTm6IB
         txDbZqmWnMCtAL2z2ilXeU8Ex/9+JHoSxOFI9pqn2nHM/+R2HRAJUrYVFAUmZi7U6I9b
         C0MqSuLe+hA/B0C3v2kpV0HHWGMOP1h34hp0RvQgeJ0FBBtLeEAxA+C3JolJ+4+FEDuo
         jWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787137424; x=1787742224;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4rGRVXIFEkP/eFGaEOLoP/WZecNrB0d3SfXEBkRIEA=;
        b=PdXcIpypWVnYEYLMO/YK2/CjVwK8iV7/yUatsbUOvXnLWr8opkubiLmFSYkAA/n2Ih
         LgG12kUANogfljooSFGlp+PQWfgA0eLxt+aJ3EhPTfYqasO7pNYvy/tA2UqH9xKzCBvn
         qBAlaATYJKhqPy5/r5Zg1HJunJhcBEEJdUeA0bxTfiLDRHaygYbDyZteSaglspU4/31x
         BOQufRefQDaydet/hJFWMX+1eliaPbkTs0/K56p+qHbAQeT9W4L9Sp9PnM5HB6OlDOjQ
         /IZokzJQBPJBonbjJCO9ROvU+LGIoxNmmw4hdjnRxxRh/6CarwoHP79zDCSdzrWhKrxI
         nQmg==
X-Forwarded-Encrypted: i=1; AHgh+RpKunXwtiBBnecNQG3NVacd4PqLmaN0yUM23b8oLgvOnAq6QIfftLyo7ZGmhvZjXSEe9AzGEnU=@lists.infradead.org
X-Gm-Message-State: AFuF++lDmmWz5rMu+p4LhmoLaOEyDVUZGZxkWzWpE9ziEL4cHxa/aEC3
	7XruZjutuxVxa7oogepO85lZC1T81Wmrh0bgGIC+4fILa8At61qHFVI4ZN1QJ6fIWsGy/X+nWUN
	n/dyPf8VLr5jxm5lhUdp0L/Wj3moBkeocPr1uFW8q2EnTI+uWNr+15yf+MMo4Jhxg
X-Gm-Gg: AR+sD10DgY7hHxczmeCFLlMSkz7hoSbDlLYGI9YIeh7TVFyI9xZeUt3ulR2OSPUa8e/
	nIJtsTuS0UzjAUo9xX+T4slhq+ghpPdtTt2E7r3R+1WU9eI89+wYpJXqK0sKU/JIXkSLYJRv5RH
	//SP2zGfePKvoiRfnJugUZQzNXy62SFJh/5D2tOpkA/hWJ0oqNnZyNcvMFbYSSeuOsNHNzrZZya
	5ekmjQqo3OvsSAISujtKl2jgxZKJhN4VWocT2Rfqs9coftMB1fwtVbQ105mgLbU+ILhhJx0nnxG
	S0E8X2utqartHMzja6ADR8v2BXu+ldHmFMA8MBoHZndG8gTpAjZw6TzrgmZ2zcKQ7fyZdzWxk40
	/8IzF7TV6kkpyrHjqN02YkrXamEqSo6+Z2NQIQ+D4U0AzJaMHUF1G0C3uWc+2pmvlEJZ0TV+g0A
	==
X-Received: by 2002:a17:902:e949:b0:2cc:f5b8:4c2e with SMTP id d9443c01a7336-2d601468c49mr75918245ad.9.1787137423871;
        Wed, 19 Aug 2026 04:03:43 -0700 (PDT)
X-Received: by 2002:a17:902:e949:b0:2cc:f5b8:4c2e with SMTP id d9443c01a7336-2d601468c49mr75917245ad.9.1787137423415;
        Wed, 19 Aug 2026 04:03:43 -0700 (PDT)
Received: from [10.133.33.152] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb51e0e5sm25564745ad.32.2026.08.19.04.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:03:43 -0700 (PDT)
Message-ID: <cb770572-c837-4431-a6dd-d23b3a59f352@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 19:03:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath11k: fix reg_info_store leak in
 ath11k_service_ready_ext_event()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260817-reg_info_store-leak-v1-1-77025a99b074@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260817-reg_info_store-leak-v1-1-77025a99b074@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NoPhtcdJ c=1 sm=1 tr=0 ts=6a858d90 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kraVzMtvL2C5sCo40MEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: KrUtXxbOyTD_FpkFP2Y1Ir112qB8WScP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4NSBTYWx0ZWRfX+tT9MfrqLnNC
 WL0g0i2Sk7+VsKwyNBViFg3/NENqQVzbPbEIarVFy7U8QWFFEq3vzNme4wNvXMZZfdspNoSZ8hK
 3aBpRIGJQNOHnkcq/OrtK2FdY5tzwtM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4NSBTYWx0ZWRfXy8Pxt1xmQUqb
 6ec/8+RqYAs0ZUovT56pfuNGde20vLw4Qpy61zFXGV+UBcFUfDMQHsWBZ8UPVUWRaGVzxXtB+sE
 SjJU4LhWVW9McpoeMs5uMoEWyuBSve61OIF76YHgT0NUX//aaxo4/AdQzAregnhlVF5V8kSih7Y
 JuQhIwTd5ELfejFo8kLNugh6tQN7emF6TPLoYO+3Y2xqCtVbD30OH/j0hjzPJ4/urv7Uqk+i946
 D16SI8y+/Q1C0t1urWacx+uF/+A1tsEpN0K9+v1BNEIW/1li/+UYyntKPwx50nd1id7gk6dlACA
 872ETbc3UA+rx/6buujVu8IqXuWsyAfTFAw0HDSDRZ9OhzWUvJlaGFxJcHCAquu90PQlWnte2tC
 bQ3FMVICaQGSWcuJyr6svbXCZLXrj7cJ7dz+JKzyixfi7tDz+XCMkC3dIU1WgsCecimkblUhZfY
 FNVT066Yw/hssK5pkoA==
X-Proofpoint-GUID: KrUtXxbOyTD_FpkFP2Y1Ir112qB8WScP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_040345_250098_A11EC546 
X-CRM114-Status: GOOD (  12.08  )
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



On 8/18/2026 7:46 AM, Jeff Johnson wrote:
> Currently, while processing the WMI Service Ready Ext event, the iterator
> in ath11k_service_ready_ext_event() can dispatch the HAL Regulatory
> Capabilities handler ath11k_wmi_tlv_ext_soc_hal_reg_caps_parse() which can
> allocate ab->reg_info_store.
> 
> If a subsequent failure occurs during iteration, the ab->reg_info_store
> allocation is leaked.
> 
> Directly free and clear the pointer on the error path.
> 
> Note that the normal cleanup function ath11k_reg_free() cannot be used
> since other regulatory-related fields are not yet populated at this point.
> 
> Compile tested only.
> 
> Fixes: 7004bdceef60 ("wifi: ath11k: store cur_regulatory_info for each radio")
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


