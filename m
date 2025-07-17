Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE69C83F1B
	for <ath11k@archiver.kernel.org>; Thu, 17 Jul 2025 12:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsEUvuBRDMzRKRRLJsUyfbmC1yOuPlsLU/0xN60mrqE=; b=ma/wSeybWBGs497fYjm6wav0ZC
	XTvqmEboOhAMjCf/EeHoLi6/CThmuf98u+UUzbKGmft0jvf2fK6ZZUub/aXU4Jqubn+Fwuh2uq3Lw
	dzeS2/Ouj/Cau2nkqPX0lEUzNGDcnR2rQd2Og5bVrGvmt6oSkfaqfzrgpMEGWHJIzjJxNz8tou347
	Z8MVw6H1VwMLSCgUsVq8UdvG8XDWlfsd4KQdtg3fWWYM6M/VpuPRuvpgKDkLNT/op1lZ8O6ksgexS
	mdBPtT4yu9VZolDtWYPY+niWxsig+Gf6yN5KDEYiWtDjC7WWuz68R3RDst0jIkR47mKpCxqiHlf4w
	JGj0ay6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNmb-0000000A7Wl-1xQ4;
	Thu, 17 Jul 2025 12:32:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMHH-00000009vFx-0neW
	for ath11k@lists.infradead.org;
	Thu, 17 Jul 2025 10:55:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H5bkfD021791
	for <ath11k@lists.infradead.org>; Thu, 17 Jul 2025 10:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EsEUvuBRDMzRKRRLJsUyfbmC1yOuPlsLU/0xN60mrqE=; b=IZDJwHd6XDcNhEnd
	3yf4+K38F3BML7mfcVVvbjH/f2Qlf0RdNFFggnIMqcGgv+5Tx0PZmXfho42t04C1
	pKsN6fTlZYmh5W077iGc97meCjX52xm4sbvx7+NN855CHSby5S6C3cW9gvHayI+Z
	YRFiQEnF8EnHazbc9mgiPOtVsjKT0rYYbVwRpSNlRztyM7kDY9kwqbSqqIlesG3O
	SN+Em2culeXThD9nnqxvOn5WH211W6FBvPA2gpI3RRHyQm6TZvSyboWXkhGEd+fp
	wjMTQulwOHt3I/Esw85vMa4xMcnyuWecMgFQosNTBD/xy+gDyhKdfxfukzSBjAZR
	oo3vHA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8f6af-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 17 Jul 2025 10:55:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab7406bfa1so1663171cf.3
        for <ath11k@lists.infradead.org>; Thu, 17 Jul 2025 03:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752749749; x=1753354549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EsEUvuBRDMzRKRRLJsUyfbmC1yOuPlsLU/0xN60mrqE=;
        b=NgwgrTn0l5SJRuBBbqWIhBW2bJR2OXxwzGWLatJ2DKdFA3hxE+Z4fazhXRzhd/TCI1
         JbwSOTNg948FE3/V+QnwaVj89ctR69MOzc+U7inn+2vF2oFkeHffUa2d/yv3a9Y0saKr
         SmBokYAxEalQN9gWcN7tRel9Rjp4jRo+eZAOeHozeolb2BPa4owN359st7Hqq1EdqcVT
         pQYKfHdgqwi9tJowRXqfgTHB/gSrdbi0bPzSWVyH9sLmhxpFD4WyZjDejpb3SH2xsqk4
         Wo4cr+oDYCrc6ep9aMZsDh3dSva9CtZzbrZVr8rjQKpgJByDstGA4ej1CvfaJB6Vyioj
         VLaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv3JEm9WcD3rlJ0BFvGLmajt1AVzIZ9i67z5vw7Ld9L7X8YcJwEQPAUATFdpZzXpmPz8Y8m0A=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOLCTfvscY22mXbqsY7Pjs18c8xkw7V4dZVF5UHvBa9dJ1BzQU
	9f6HSwiS/Z5+2VVfqvTa5BIgFmWxQtUUCy6+2Bvk9A0PaHYp5kwfRHLcl+E8114onx0b5GPdezR
	TvTfTL8XESSCff+9y2vLgkPntvrpktbdhBENBR4lOi7opS/LCnrhyX03rQosIMTes
X-Gm-Gg: ASbGnctPuTvoGgY4fHRhkp4LaAtHGU4xhBfSGJfWv1IuakpH33S5px8uXWqfkcZdWn7
	N00lLsHisiMBd+m83lbQSY/wfoDlUUP+jQVgueGf4Lki5yrhpguVXu3zjETXhMRRlmupqMi8gs+
	45uJQFjj+s/FvHHgF0BT5JsAaEQrZolma4SO/n30e5TAZOLZR7RFGT+/mcGmP+aaAdFVuIOiIEE
	UPIntgsUnwSX+mVfsZx/eiaSZEg51fn76XOmOVBd+b5EHEp0qy0eOsEuzyFXLsBVKAAYSQDvDiY
	egWPm6boPwnYBZDBNHazG1dleqiLoOmmSZVHJkDV7u2wICV7B+90sZFyD2uQ2zu4ZNooI4d71hn
	hwzx7DlvPYmXypUKcgIzm
X-Received: by 2002:ac8:7e89:0:b0:4a9:7029:ac46 with SMTP id d75a77b69052e-4ab90cb3599mr37974061cf.13.1752749748794;
        Thu, 17 Jul 2025 03:55:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIXtaAbwds9yIaxYyNO5vMi4lC/pKMkm1pehCrB0BGO1mpogQimYGvbA/xUnAXMGKXn/lD6Q==
X-Received: by 2002:ac8:7e89:0:b0:4a9:7029:ac46 with SMTP id d75a77b69052e-4ab90cb3599mr37973741cf.13.1752749748206;
        Thu, 17 Jul 2025 03:55:48 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c9733935sm10034847a12.46.2025.07.17.03.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 03:55:47 -0700 (PDT)
Message-ID: <5502b2eb-f6d1-4ece-b918-1c8561a92607@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 12:55:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>,
        ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
 <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
 <38ace6a3-d594-4438-a193-cf730a7b87d6@oss.qualcomm.com>
 <wyqtr3tz3k2zdf62kgtcepf3sedm7z7wacv27visl2xsrqspmq@wi4fgef2mn2m>
 <03806d02-1cfc-4db2-8b63-c1e51f5456e2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <03806d02-1cfc-4db2-8b63-c1e51f5456e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA5NiBTYWx0ZWRfX9GSANR+4frYS
 hUT28Bny++rugbQdTFZOVpvmPQg6uM91ptsREm12jIti0UTFLNemSwJBk9jfQeOtjx7jKP03sVt
 JT4YEG7An/28+9a6QDl+IpA1rhsVRhAEk+DlWybiHAOQ4olKZpYD/9evw+v0OwhhauMEWPIKrLQ
 5MhnmGe4jRDzZpYUzmspQ6Nnn6t9ZOWWuhsSQpeEt2UqYv2Q7raJDZM6/3Uy+WCGHWXAUTARYOM
 npDnVJ92qqkAymv+U46aCgFALbbp0iNd4/t7KXSu36sey77f5y0zLfm27YIoDQoe8koyxRX/35M
 IWrKUmTQGZX5lunJqj/RzvzQT2EZAkNkeEnztm3bbTDGK6N7E6B4tNDpqZFbrHnaktOinsUEkf8
 iGNxx++K+XpjUEpD+3SR+TjPYCYf7D3tRSicR4WIMKM4BPb6dPXHizInYuO/kYnZD1aUwNJJ
X-Proofpoint-ORIG-GUID: yRsPWxucaTSVb6Bgl_TjTjcORUWqXoR4
X-Proofpoint-GUID: yRsPWxucaTSVb6Bgl_TjTjcORUWqXoR4
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=6878d6b5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=a0K6PxZnllCBz7J7qkkA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_035551_352419_A6FFD5A6 
X-CRM114-Status: GOOD (  10.48  )
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

On 7/17/25 12:46 PM, Baochen Qiang wrote:
> 
> 
> On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
>> On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
>>

[...]

>>> In addition, frequently I can see below AER warnings:
>>>
>>> [  280.383143] aer_ratelimit: 30 callbacks suppressed
>>> [  280.383151] pcieport 0000:00:1c.0: AER: Correctable error message received from
>>> 0000:00:1c.0
>>> [  280.383177] pcieport 0000:00:1c.0: PCIe Bus Error: severity=Correctable, type=Data Link
>>> Layer, (Transmitter ID)
>>> [  280.383184] pcieport 0000:00:1c.0:   device [8086:7ab8] error status/mask=00001000/00002000
>>> [  280.383193] pcieport 0000:00:1c.0:    [12] Timeout
>>>
>>
>> I don't see any AER errors either.
> 
> My WLAN chip is attached via a PCIe-to-M.2 adapter, maybe some hardware issue? However I
> never saw them until your changes applied.

It'd be useful to know whether that's a Qualcomm platform running
an upstream-ish kernel, or some other host - we've had platform-
specific issues in the past and the necessary margining/tuning presets
were only introduced recently

Konrad

