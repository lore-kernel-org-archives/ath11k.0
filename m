Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E101ED7B99
	for <ath11k@archiver.kernel.org>; Wed, 15 Apr 2026 03:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAotFAiqJiGXdaNX/JI+JOyH84jDiUIJy+533r0Cdeo=; b=IFM3n5+hbtgxDUe/T4/BeNIHln
	roHHT8ef3HB+/LWWouN6zipnI2kMtqaCXWqFDo3xvTqf29HUjgeWMQfpUMMnnHAv4CdMH5RdAgY9P
	xlbgOFFOA2b56I+9Fwz9HIbkuxU+lmBo3cLD+2CNfdSAW8W85N0vcDVT8Yfp9fIlWgkuI1iJMyD+s
	4ywK5UYutWmE8JU1w/macykBH9zRuQ5O16DcNTzcx0oTBqwC9HPyC689TDiI1zIS7+ip2agalxi7b
	LhkZ+Tsa5/mrPn/wo0K9ONAO/Je1Np7zSqcxNJc6c2PxY4wolKZAxpP2cG7Ph/jxf/QyDynIZCNYV
	6dIjtErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCqjZ-00000000Vif-1Uuw;
	Wed, 15 Apr 2026 03:16:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCqjW-00000000ViA-2cRA
	for ath11k@lists.infradead.org;
	Wed, 15 Apr 2026 03:16:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F2UmXF2005557
	for <ath11k@lists.infradead.org>; Wed, 15 Apr 2026 03:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yAotFAiqJiGXdaNX/JI+JOyH84jDiUIJy+533r0Cdeo=; b=TPgveN5kaPfd2c0S
	/fQsg6oUmfmg0McWRDIFM0cGbvmN9XS5Hh+ExrzHF+xkeuPdAWcbclRk4RtiEkfd
	yGicujRDwusINCGSmi2w26sveK8QJJwtuby7tLHcp/GSXECHNn8oD7C599QzoJU5
	nUOyaqavBnRdfWUxHP2kOoS0WO7mtfQkSwsJ8etq9oZp4QKJeoemHDBT5GobgTVm
	MXRKWE/4KsXdKqFH2ZDTCvaqjBpE90UVa8f59oNZziY1QTfAuFFSkVJIfqQyCXS2
	x5wDik6C2Q62uyriPuX6Ov0VWpRuoj2PvWJna5bjtDgJd+dGk2NMt1VMLjWZGOE1
	hHm3EA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrsjsw5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 15 Apr 2026 03:16:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354c44bf176so5908575a91.0
        for <ath11k@lists.infradead.org>; Tue, 14 Apr 2026 20:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776222964; x=1776827764; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAotFAiqJiGXdaNX/JI+JOyH84jDiUIJy+533r0Cdeo=;
        b=CKfUdvIHNDu4D4h6KEtxnzszAcWVcC5XR42vpMRLTQBfzV/NXFPUqEHrjD8mRqcOri
         s5sqccPCX/zOrV2N3zNk6Ijm1Kr3QseooT5wLYiY5dFtHIAEyi15AnRKUGevsAISumVJ
         R2kJPn0cNQtkd0id22f/UbT8uacGR+KGcme/S7o+c/JhLXhHLAeYRHXvwL6sNIVRr8Q6
         PtQuuFqDqHtTwexD/rM+JmBqh+Y1yB55bbkFybK1Ys/6d9Py8wofmh7RStPommcmTikH
         25ga1jxcjr7rP3JJD/C07voZgMADxyA6gejiPjehdhfA3vzK7YKFgxjQwrM872MsJWSz
         kLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776222964; x=1776827764;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAotFAiqJiGXdaNX/JI+JOyH84jDiUIJy+533r0Cdeo=;
        b=HSaGpBto9DqOJygu1/Rz8b7flW8AX3RYm6iyMsBJ7ASWP3egBleybE1iqzMkCwPopS
         TMgv71uISpEFugAyL0j4Xkifz4RO3JY9q2+02DvybzzJX0eM18LflZn4NSWrvw9qb4kN
         vq6sJalSUcTX6zmRLCNf3HcZh5gGD78SWqdrY79yIGg01Me8ANzQm42JjZsUxpKJJdnA
         MPyHFc7Rh1R16v1FrHOVOoqaZfu7y8YUoQ2JNJO2qxFBQ83KP046LjOQs17lc6+cXeCX
         jhWu7F7+htFnRG1S7G+xwyVR00VpEjzxDLlHLwAdGiKLXm/SXGnzrtWscqN033+R4pNq
         sezA==
X-Forwarded-Encrypted: i=1; AFNElJ+Z+YOL99cLtZrUWjFSBK6eu9hhFu9wd7AdDpHnFtA/v3EE0jJK39psyPw4fvqWIKlsEhB4tKk=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo7Tcd7I7wo92sduoXUaKIlxNySGyqnkzR5J/t1LhaY0r/eSdH
	ghOe8YZPm57RhNZFJxnniY9cPjB6p/07qRsBfg65SV5NHa5nX5EMkGp1buHo0+Lx3yy0YjC7n43
	ATpbdfbDp61CKQ+ky/q7JPRSBYRt3nQxI8O19khiM9GSxrQIbKGUfDag5n95AZvlL
X-Gm-Gg: AeBDieuh3guQV2Jms3WkmC8Fwp49ifSKPG5BzYYn7L8vaPKM+c9ITE/XOaLfFCGKR6c
	RLnwy57D7IEWr/ENqz6jFtaOrfPws8nPj0fW5Zy2zsg03OQTXNfOR/fUByDLLKo+WX8e/PwUwEE
	nDBQK4WDgmrdVBoXftYKDpZ/dB3+d5/V0spYpsaZAnjDjxZR19fQNBqnRE660DIXFZPQO3pkb3X
	ptaUcHcNNh4zIunw36CF02H+u6OKdPoqjCZFTV4vfxWF1CtoWjtExhITWY+IKyQxkCtVWKV17KR
	FdZOldcg2PC0Z8l6ECHccARVnX/8Y42Jf1P+51HN+2KtVv5g3/5+cZIUQt52M5azM/NHd7bGGFC
	ZNngzgCOi+wFyHi7Zkc5PvMGqTD4q5IYDt37LDOJ97RKC4m5V3vhS4eRpEVUAK5cYv0ORbRmPve
	Hfzg7vc4gCAP4KkRLTIADN+Gw56NKHzQ==
X-Received: by 2002:a17:90b:4c4e:b0:35d:a2d3:5c31 with SMTP id 98e67ed59e1d1-35e42858252mr21452660a91.29.1776222964316;
        Tue, 14 Apr 2026 20:16:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4e:b0:35d:a2d3:5c31 with SMTP id 98e67ed59e1d1-35e42858252mr21452614a91.29.1776222963700;
        Tue, 14 Apr 2026 20:16:03 -0700 (PDT)
Received: from [10.133.33.118] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fd3203a76sm357994a91.13.2026.04.14.20.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 20:16:03 -0700 (PDT)
Message-ID: <b71bca62-e467-4c88-a6e5-c44f13d48b4d@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:16:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath11k: workaround firmware bug where peer_id=0
To: Matthew Leach <matthew.leach@collabora.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20260326-ath11k-null-peerid-workaround-v1-1-0c2fd53202f8@collabora.com>
 <87h5pxlpg4.fsf@collabora.com>
 <7dbc3836-c42c-4cbb-a50a-011d82a0ee81@oss.qualcomm.com>
 <87a4v54s88.fsf@collabora.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87a4v54s88.fsf@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WKhPmHsR c=1 sm=1 tr=0 ts=69df02f5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=p6f2LkNNnSkKDXlKyPwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: nIOVE-U665BKL1Ubub8XhmCb22AyG1Zh
X-Proofpoint-GUID: nIOVE-U665BKL1Ubub8XhmCb22AyG1Zh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDAyOCBTYWx0ZWRfX8votWgJHu2Tn
 0bkkBUSHm7m6wCza038HzHakxA/6FUiBy+0HJo6wSkpnySV1XFpoVE9dqloT14X7cgmgtPFmzic
 YBJpbUU5rjoUQUQMaPcKGhzcjkJAjGeo1PX6dicoLlWyeU6UF20qvEUcfI+i6z6KZbzSzIKt5re
 VNy/tutHzXN0IMLDYWk4LlV5Jy+kG9sheF8eO+khkZn4jSU/SujU8uzXj+mOqAjvWr7t38Ngbo7
 JY3dZ0wdf2JAXBurYEOw6dOVIwpKk4KYUhadKHpNGXDNezaNVfpmyRrMNqOzxIkLpkpGm9FAUu1
 kMDZtgl3EXU3xWxDv8sNxkzMRpOsSpCQMRZuPLuz0SzaDRd6VrtgU+JRBr/bvetNggQdw0hI0cv
 kJ/iiKBPCK0XRnDjLE2lZ3of5KK9QvhEaXOvcyVGhFPbAWDYCBBN51g9He50K6s1WnNrvjeA6L2
 nvp0CwXOdy0ANlTcHrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_201606_794909_84C173D5 
X-CRM114-Status: GOOD (  17.05  )
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



On 4/14/2026 8:54 PM, Matthew Leach wrote:
> Hi Baochen,
> 
> Baochen Qiang <baochen.qiang@oss.qualcomm.com> writes:
> 
>> On 3/30/2026 3:57 PM, Matthew Leach wrote:
>>> Hello,
>>>
>>> Matthew Leach <matthew.leach@collabora.com> writes:
>>>
> 
> [...]
> 
>> for chips like QCA2066 and WCN6855 etc 0 is a valid value, however
>> this is not for chips like QCN9074 etc.
>>
>> so a possible fix would be to add hardware ops based on chips: for
>> QCN9074 we keep the existing validation on 0 in the ops, while for
>> QCA2066 the ops is a null func. Or even simper we can remove the
>> validation for all chips.
> 
> In that case, does it make sense to remove the condition check
> 
> if (rxcb->peer_id)
> 
> in ath11k_dp_rx_h_find_peer()? It looks like this has been used as a
> small optimisation, where if peer_id isn't valid it skips checking for
> it in the peer hash table. However, if on newer chips peer_id=0 is
> valid, we should remove this?

yeah, I think so. This check was also based on the non-zero peer id assumption.

> 
> Regards,


