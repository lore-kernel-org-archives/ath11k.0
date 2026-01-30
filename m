Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902A1E6BF39
	for <ath11k@archiver.kernel.org>; Fri, 30 Jan 2026 20:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tz/hsnbD2K7FC+wSCS9iQfBJ4f/RO7qpudJGts6770M=; b=T8C/tCKTmGjSMTC/cRbx6sGZ90
	qwa0IbEtSQCWw/ekcGulxjwTalBrnq6OxCYdrT5/XqkbBS5fV2r3X20rUGZsG1QWWckbgPm2RFfJp
	MJOwoB/JATa/w6raNsp00JO1J4EbI3fXQUGBBoB2XkvEaRvUuEq+6XmSJNj1/ZRpp2fpXMDajmu7C
	H0SW8wzqRxqfkbHtpWSPYVIAmSgHzC6UZAsMZ8Xjj3Yl7oLk8M0LfAn44bz0my/G2eWek/gmWvIn6
	qFO04do7nIVYkwLwiHccDv3ZUN+guIkiogXc+Dj0o33Ewf62qgq2B3qMlVCy4KSuLvABWOkF2YznG
	9C7BoHdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlufz-00000001uRc-1tvq;
	Fri, 30 Jan 2026 20:01:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlufx-00000001uQM-0lbP
	for ath11k@lists.infradead.org;
	Fri, 30 Jan 2026 20:01:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UJEWtU2930025
	for <ath11k@lists.infradead.org>; Fri, 30 Jan 2026 20:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tz/hsnbD2K7FC+wSCS9iQfBJ4f/RO7qpudJGts6770M=; b=bDrwHOQZYvNzAECP
	RAruACmted87t9FtA4Z3d82HJ2nKgE+X84dkK2fQNVyiSTsvrVRbVGQIbSqYzXLa
	z+7RSj3OJsdh/do/aiM6RMVh0BLcSKgHolYY2eK445CCx2jFHUl4ULb0KhmBiPRY
	BjhTZyuTbbEXgg0J5TsD8HoJw5uXml211zxyGSc6JZyZikicX2Wwd2MJZMbhaG04
	88EG1uIKUJ5jFVXRJkbOP8mIlk41YcEhjM294+Uu5Zsi9i4O8j1cuNTzBPsSLXT5
	eB/4LjIVM4FW4ukmmQGiH47B1iCtCrwRzQbxsp659Zt2P2AuNthFIgFG1iicOBp+
	x6SMlQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c12mmg3vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 30 Jan 2026 20:01:03 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12337114f3fso3648564c88.0
        for <ath11k@lists.infradead.org>; Fri, 30 Jan 2026 12:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769803262; x=1770408062; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tz/hsnbD2K7FC+wSCS9iQfBJ4f/RO7qpudJGts6770M=;
        b=Pl8Fsz8Mnqs80yAeqsICjpZMYuw0YVjsI5MoC2nEkEYmPCIh64uuF4DCe3E7B7epVp
         C2Xw9I3g+grDIdRKu2Bmq9LZMbHxZ3m+ahmfAPyc+ryJa/jko8fuOX9IvUTNjoKRIdK+
         mxoWENl3XjFAjD/EWcouza+OZLHVS9N140MYZrurLxaQzs64PvWkYzzgc7bV4gFXflxr
         oT3SgLDjQSk/FRYhSMakWZYDtJ0HL4z15hi2yumpn5Cnk7cfB+DCZIVij/zpwSkUJmMw
         0/CJLzmZZdnYGpa843AQA/zE3Z4K+2+2KpSffYbEuExCy9Y+UwUwFR9yr1KQjb0pqLov
         ao/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769803262; x=1770408062;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tz/hsnbD2K7FC+wSCS9iQfBJ4f/RO7qpudJGts6770M=;
        b=uvud+GnjYLRIpPmmxFUt9D7LS9xFD6ndMk1dZJ2TcahR1Wk4CnwrgNfnCzklwEQOCp
         Z//2YjVLjf6nqdZbcpZfkVWA2r1bhkyheFmr0qGa4kUUI1d2d+ja9El3s5dhVk7sRo27
         yKFxJVixCg4jUdcYPmJDvWkBfxiLdksL5WLsc30piwD66Fy8SrBSnOdGTFf9kJRueTKh
         ulemoiLmWm1DpGbu7DJj2xwBtKPtjsoppl1gfCVDOEvZR2EgA49kbbqbq7m+Htv+AU6T
         0tNqpGptiWKA49iBtvHFjo7RFkZsnkhBr0Iu6coZi1c9xZlKzKhX21Xns2pGovwhDer4
         7kPg==
X-Forwarded-Encrypted: i=1; AJvYcCXv1L9SXM6IEK8TYw22gekNXj2dfeRmo6uMJYdTM/2AL3eyeT8mx03z3KixxQ1meME1Agrh9C8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy85lXYn8aeurw/Ev2xcpAv7vSy/sysKcYW6kyW+rwxmr0Xi/Bp
	XQ5aOhT2rEiI6Hu5yTu0IkqR1CtKzAsPqnEbFUzXi+gfWxh4iw7/BZokDjSA9EpiWVL0nFTbU3g
	bhAm5UMxOPhpHxwQCRP8DnGQ/BY9gNYFhHiM3j8xEkN/EnyLB85JoanjeeUtg2KP9UVNgA3J9
X-Gm-Gg: AZuq6aKyGKaADt/hC7sFIxQogluhIotyO6N5k6J6Feg/4VHV3plN6n7yjVoZuRZohTE
	yhbf63EIrF1PysYxAWGF58o2O+KOhz9d2rSOR1xR8jmDUevDYkk5puD7tfzUIXGyC0HdOL/l53r
	s6slIN0VpdYIm6H0XmrJ7TYCUYDGkqXbD6VLst9sDCWujY242LCDTKF9MtKN93BF6IAT8iynmp5
	4ffvARCyzlS1BGqxDxeT4zO6TSrvKbLhHuikRj6BC/pcjOdqH8TITvduIKM6bwykmPO4lUctb38
	lvz9aKwt5BFbe/gkJTtBYWThdKgXBsgnPH4O65NOuHAtjSMq48PeyQpDXuG4y/klCKxMvMeVJAK
	9kspmj7uH+lOINOtz/DNTjV9NlN+/QOb5gs4noIAn2vHzkYA3mwyNLFmw3WkvxZgse4F9iqV5ua
	Aq
X-Received: by 2002:a05:7022:6082:b0:119:e56c:18b1 with SMTP id a92af1059eb24-125c1000e70mr1983168c88.25.1769803262330;
        Fri, 30 Jan 2026 12:01:02 -0800 (PST)
X-Received: by 2002:a05:7022:6082:b0:119:e56c:18b1 with SMTP id a92af1059eb24-125c1000e70mr1983143c88.25.1769803261707;
        Fri, 30 Jan 2026 12:01:01 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9efb4casm11546699c88.16.2026.01.30.12.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 12:01:01 -0800 (PST)
Message-ID: <7a763739-8acb-4bc2-92e5-3ff8a3fa2bf6@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:00:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260127
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <6f1fa3be-e28e-4653-bbf6-b0b64b7e65b2@oss.qualcomm.com>
 <usrawtmodalbj4b4i22tk3hzgbrpt3gdbji4x7vfzdhp6qsb3g@rw2bl7jdnp22>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <usrawtmodalbj4b4i22tk3hzgbrpt3gdbji4x7vfzdhp6qsb3g@rw2bl7jdnp22>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4CKXvoQzrha5FEFULXzqmeggQ6xYPRl4
X-Proofpoint-ORIG-GUID: 4CKXvoQzrha5FEFULXzqmeggQ6xYPRl4
X-Authority-Analysis: v=2.4 cv=fZKgCkQF c=1 sm=1 tr=0 ts=697d0dff cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RcOUi4Ga9jvAjSuFGeUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE2NCBTYWx0ZWRfX9tvX7Gpp1oWX
 Kbw74gvH6kPcg0XnHGMynr9HOh7Ao1bMfrs3/X6Y6j4V21ojO6I2XcAlDN9vEolEV+bLdpzj/KO
 r6jfL5wImd0iigLl+5t1RBKbr5P9mgQAxvDCQaOjnpibllcGfwyd3g0CvRR2Y/kQCsrRNIynxvL
 js+AF47FpVfTqcyDa95fe4kBSdn5ctmRw8DuVz8VoWVS5SlyYQmM62QTlD3Iri9ELoCinDdetG5
 X6OdxvTmMtDq+mAMO+Cn4MoaidXr9XSGd1GncTBiKz3wxueNllTfqt1xPlnYVlLhv9s6ip4IgeO
 MI732CRvLUQw8/fV72VR11RB5mhr4O14g28fMkYOoZISNKscWIYmksNmzHtIEDSNsJSyQpvNvZq
 8txtmPfYXZLoJ3Ya7gAlqsHnPILMGJW/sWC7Gh2skuNrlgNOWmd1E7F3Ca7mSrdHJl6wwc2BnNx
 wSpmC5oYaDAlSNsrYqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_120105_333442_117BB48D 
X-CRM114-Status: GOOD (  12.09  )
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

On 1/27/2026 10:36 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 27, 2026 at 10:04:46AM -0800, Jeff Johnson wrote:
>> Hi,
>> Here's a new pull request for ath10k, ath11k and ath12k.
>>
>> No updates for ath10k.
>>
>> For ath11k update board files for QCA6698AQ/hw2.1 and WCN6855/hw2.0 to support:
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=255
> 
> Don't we need the variant for this one? Otherwise it's too easy to clash
> with another unprogrammed board.
> 
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_Hamoa_IOT_EVK
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
>>
>> For ath12k update firmware for QCN9274/hw2.0.
>>
>> Please let me know if there are any problems.
>>
>> Thanks,
>> /jeff

Please drop this PR.

We've spun a new board file that addresses your concern and I will be issuing
a new PR.

/jeff

