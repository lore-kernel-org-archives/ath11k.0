Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B08CD8CB2
	for <ath11k@archiver.kernel.org>; Wed, 10 Jun 2026 11:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZD9n6XhJmxub7zVMjUNqjPaNd96A5hGk0u4sEFo2yg8=; b=LGK7fPPaPnshKWIuhpqHqetkIC
	ocjKqJ/LSPdEIwGt5ih298PqDYV+5Rlaq1er3h5iJm+QEEF/0Okxnmy/1DEmkXQy1egIeHmrt3T8P
	tONUlXdfbI2MB8MYpUYA5bcgnm9bqhmMC0IovqyUu+7ApsD3OBx+o6oaqN3SbQTbMs9wqZeGrBFuX
	4DG87rn+zNLAC9hv0BPrC/yxIh0CLnolDDTAEI0IxRvPYTTwHMZX67NmIkbOpHYGXRP3C0ajOK1dG
	7BMQNqY4fHWVqjv72FNcjwe0cRTSFYop3Uj4UZwEOUnpcP1v9iDIFwlnmgsu34j0gUcMQAB0HbSF7
	Bs8iJFZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHYF-00000007aQW-06nA;
	Wed, 10 Jun 2026 11:56:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHYC-00000007aOs-0P76
	for ath11k@lists.infradead.org;
	Wed, 10 Jun 2026 11:56:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ABNKSS1063917
	for <ath11k@lists.infradead.org>; Wed, 10 Jun 2026 11:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZD9n6XhJmxub7zVMjUNqjPaNd96A5hGk0u4sEFo2yg8=; b=Q4ZWUh082/I2tJxH
	wcsRsAAyztNt94BTZQfa0qye8GdRn8zj/iD12UJIwq/wWRsaJpk85ZHgK4Bef27A
	79XqY3MBHWIiPcZlijG5zbQX4pySNRxHBxexbrCP/WNJBpRU2mpQoxgDpvEujUMv
	igx18QQsEIQUxxzmNuPL3mrVHcHYXVdKKm74DzfLmJ1/f8+jUK0E3KVClDiBdspK
	R+wJCRttcpPNGJqtlmyOBuR/oWDUfpkr+7QyynfVKMTYa16bqFxVeVRDfXUS+GiG
	X5tPqYy/gZtBE+iQrpf3R4jeUA79Zger9qyg1JOVx5qIJjzPoq1OiZV658ONZPAu
	HPJYcg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1rnpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 10 Jun 2026 11:56:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91571f0d3e3so98386385a.0
        for <ath11k@lists.infradead.org>; Wed, 10 Jun 2026 04:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781092610; x=1781697410; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZD9n6XhJmxub7zVMjUNqjPaNd96A5hGk0u4sEFo2yg8=;
        b=NGEsrQMMhie1njg2e4x3pV7kmMqy2Lm1pw375udwQuoWX/TjjRxAvGMSucL/aoZN48
         sghBjBmuhqRSzDg0KAmRsFshzJoAww73ob6B+V+8/LRz7O9IPuXcAmjOUKpzmXZmilWr
         TNP+dKyCHkwJzcV3eHoyaFj8VDZt4X7EXep5VuzNKc5DM+zXa4tTHRqwuJaYt6Gq69eh
         Qs7SQHSElBYb9k1MVnsNNj7lKi/JrD4/JSHk7z29NSsRw9vpADvt1+Ya7JibkL7GzgxR
         wvu9HJKBdu8GTXqBj9OT5uco+dFMJ0Ay9o+34QYwV9EB3g+EZ3PIEIASv6P55msEXNaI
         1/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092610; x=1781697410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZD9n6XhJmxub7zVMjUNqjPaNd96A5hGk0u4sEFo2yg8=;
        b=dU1T050Ilz85jqJUZ525ceZceTK/3BldEvKIWfo0qt+PzDVAtGcmip4jyDdtKY+YMb
         PhWQa7XDwfY9AtlxaenL/irU4H13nQBVIvn1u1Ec2oJz7VAHOb4WhdOqNDrTFYv1wE9Q
         9xyub72O/TMSiugULX91EukR0aBGK6YXBi2bOVXdd52N7eZdGVdgbJHLPR2GjnOrxg0Z
         zL/T0eidCnoBTS4zS9ALFrVhcYl7mLsm2gPcP0Ki0eAEHsrto6EFU5N63t7eOMXY4w1U
         Tx6CWVM1Vc8xLb47lX7fbD06ji/aFfTvtrLTSLd4rGasaRo4TYHvMFezsBdgK7lksr8h
         5p4g==
X-Forwarded-Encrypted: i=1; AFNElJ9XHyElSD3rj8MwVN8taXS1tCq06W+HCxVg83btznKQQmB6zGpZIU8ktikFldtqUWdpytqJclU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzkmEbnn8vpwBWE3TduircCDLO/fz9vy4T3cllh2S4mTE6y/MiN
	w08pnGk6v2bims/wKmlCloDoIm251ateQcRZy7lWJGYqfPONqeyTMvX2K588O4zhbcwo9gPyOBf
	EbYLI991pITX6ZTQmyBdXsvB0VBvC8utBMN8NoNZ1NOI8AcLijoKNdlAPvbe2pm5p
X-Gm-Gg: Acq92OFLq4oGZ4Y98AeMLfa41nUm3RM3lSvzM+9W5tLbvETbDjbskp/PVDKRT/zyHlY
	0t05C+W5VTtJd8ywBU+Gc6s7zNX0h2nvtHMcmManByc2ZflV0n9bu1bR8x6PN+8Z6c9GBa+U6lc
	qranMBa2ARyWkFNtYX/rHfp/CoURb9YIgqEZ4Mlttf4emrsbev5Wy3I1h0uAa0bZN0oMiUvw8RI
	Q7a7vG/qcBM7dyv1+t2+dYYwQ2So342xrnMCQYnYhPiLSsAomxSpvAB7sWnsnIcvG/96tGD5aXf
	PGejsYiwG7apxkvj3ftHrQ+OAA0aRkXsdp1RvTuMEGLDXheu79xz7Iyoj66six1+woIL3EIChlR
	d3NqZVs/jcUcHrTNyRjAVLT1sE7aX9zHOfUjVxrYCLvaa43GhsswGWd5l
X-Received: by 2002:a05:620a:3182:b0:90f:7ce2:3019 with SMTP id af79cd13be357-915e6dc038dmr698585085a.7.1781092610264;
        Wed, 10 Jun 2026 04:56:50 -0700 (PDT)
X-Received: by 2002:a05:620a:3182:b0:90f:7ce2:3019 with SMTP id af79cd13be357-915e6dc038dmr698580985a.7.1781092609704;
        Wed, 10 Jun 2026 04:56:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65867e7dsm9878414a12.20.2026.06.10.04.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 04:56:48 -0700 (PDT)
Message-ID: <affc72d8-1906-41e7-b889-c5b09d1bdd5c@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 13:56:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] arm64: dts: qcom: enable WiFi/BT on SM8350 HDK
To: Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-bluetooth@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
 <20260608151835.GA2707238-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608151835.GA2707238-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F4CAb-yo4iB00Iuo8aXJgaYGcUVTEik4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExNCBTYWx0ZWRfX6M8pKUdeEz9M
 zetbD4xgx1RuAp/OkwLmJ/4PCjTmCndak2osouNzgJDTWjRPZSIiFj21YX7xXtvkoIJL5F36/SA
 dXFJov6/NVaujqpwmN+LdLtgtVu8iL6EOaOWvLvnEAAykLyhDOAzH+tqBGVRSTrn8UfBcpZO+5E
 D8IX9u+7e0WlEqNUHSEnaahLYt+SgrieJHdV7EtAkBM0/pWpoXs+foisbF/1tNDVodnZn4mZF00
 PTmikmV1JYaDzAumG6kBRVbJSFNjCbBQsKUemhyPqlm/wGwSRufpYG6mV3YsVXXClThQcdHJaZS
 NOrOQHG5MVFAfw3yewJnNj0m4Q3uPtmUkoOR6Y2PWyDS5XuQVKksD9x3Na7NBYzVLpzwyF0iK0B
 2INhkAmRUaLIgY9J18On9B9/PnNVf1ksjShI30c/fmA9RVByFEVLFVGJO2YQdqI1/qgw+7kUBtE
 zkIKa90aQYmef/tUeaw==
X-Proofpoint-GUID: F4CAb-yo4iB00Iuo8aXJgaYGcUVTEik4
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a295103 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=PJdgiX8PLVy5AUVXCKIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_045652_148934_98216CDE 
X-CRM114-Status: GOOD (  14.23  )
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

On 6/8/26 5:18 PM, Rob Herring wrote:
> On Mon, Jun 08, 2026 at 09:59:18AM +0300, Dmitry Baryshkov wrote:
>> The SM8350 HDK has an onboard WCN6851 WiFi/BT chip, which for a long
>> time was not supported. Bring up different pieces required to enable
>> this SoC.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Bumped num_vdevs to 4 to follow other similar devices (Jeff)
>> - Link to v1: https://patch.msgid.link/20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com
>>
>> ---
>> Dmitry Baryshkov (7):
>>       PCI: qcom: fix parsing of PERST# in the legacy case
>>       wifi: ath11k: enable support for WCN6851
>>       regulator: dt-bindings: qcom,qca6390-pmu: document WCN6851
>>       dt-bindings: bluetooth: qcom,wcn6855-bt: document WCN6851
>>       arm64: dts: qcom: sm8350: expand UART18 to 4 pins config
>>       arm64: dts: qcom: sm8350: modernize PCIe entries
>>       arm64: dts: qcom: sm8350-hdk: describe WiFi/BT chip
> 
> Before adding new devices, can you (Qcom) fix the all the existing DT 
> warnings related to QCom WiFi/BT:
> 
>       6 (qcom,wcn6855-bt): 'vddrfa1p7-supply' is a required property
>       6 (qcom,wcn6855-bt): Unevaluated properties are not allowed ('vddrfa1p8-supply' was unexpected)
>       2 (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
>       2 (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
>       2 (qcom,wcn6855-bt): 'vddbtcmx-supply' is a required property
>       2 (qcom,wcn6855-bt): 'vddaon-supply' is a required property
>       2 (pci17cb,1103): 'vddwlmx-supply' is a required property
>       2 (pci17cb,1103): 'vddwlcx-supply' is a required property
>       2 (pci17cb,1103): 'vddrfacmn-supply' is a required property
>       2 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
>       2 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
>       2 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
>       2 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
>       2 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
>       2 (pci17cb,1103): 'vddaon-supply' is a required property

Most of them will be gone with 

https://lore.kernel.org/linux-arm-msm/20260522-surface-sp9-5g-for-next-v2-8-dd9d477407f5@gmail.com/

a single dt generates 2 DTBs (one overlayed) that throw almost all of
these errors.. we should be able to tackle the rest that remain shortly

Konrad

