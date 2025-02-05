Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA27C02193
	for <ath11k@archiver.kernel.org>; Wed,  5 Feb 2025 01:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/fZynMqFI2qaQKuADObBuR1aM7GnfYzK40ZwnTu1B4=; b=3NFdn+ouqnh85jZc2nMjuv6N/e
	z938S87GznAGykBg92G5LgSp9r/VgOW/4WxjHWU08ZSmgmY1CAjXxfHE6rXrlUs5tbDDklMQ2BCL8
	9/ptJAF8zsshlQkE+qgIrzu8lL1ml0tJnMEGdmZjm1GWUEp8bcFNXrsq0+3x9IUivkj9qzfgsp+pk
	8FwtTrGQ33i8PD9zzjZWLIjl3q0gsQ9xRHGNbpVYgCDq5yiukjKP3vUjZFptY50OaUq+fyVIaTAKW
	XGOz60nKhsHbNEgsNZO/zZ/ylEndqWqmEn7x2Mzulq0RHEIkNbE8G+ko/2Wnow+SQNXkM6ioA69q3
	+pvNc5Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfUSi-0000000256S-0N1N;
	Wed, 05 Feb 2025 01:44:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfUSe-0000000255y-1zrd
	for ath11k@lists.infradead.org;
	Wed, 05 Feb 2025 01:44:19 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514JaPZ6007934
	for <ath11k@lists.infradead.org>; Wed, 5 Feb 2025 01:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/fZynMqFI2qaQKuADObBuR1aM7GnfYzK40ZwnTu1B4=; b=FZfVZAwnGrY3Yowy
	yv5Z4vlXkamTGLtWmwhSzwtyDuQrKgkR551iJE/8G3gNLbRjICUrGCuMryPb50zR
	a53q3NwhSDIKHNoWxNQB3gWK1h8d5btqdomVMa8woXZG3Ut09zGNrCn+QKKeLsfK
	R9UqdpE7vE17ddGg5U6n/g0t6GqlMxx8+IRGV2AolGdMLlSJI1Fx/Hg6WzWZqWVB
	E1e/yfPt6M5XEvPey3wPepAQDdS3nuZCerJVYYfqWVBC2Pd8s5/U1zKKdRSVMcjR
	YHTNdmHIXP2R03/mGII5EjcOFQoPFeiAVQTrQO7RtMLb78V+BrTGS2AfeBp7/Vld
	o+1SoQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ks6wgmfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 05 Feb 2025 01:44:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-216266cc0acso8612255ad.0
        for <ath11k@lists.infradead.org>; Tue, 04 Feb 2025 17:44:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738719853; x=1739324653;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/fZynMqFI2qaQKuADObBuR1aM7GnfYzK40ZwnTu1B4=;
        b=CuVsKYMvApcSTW2T9mUH9U6xZZo/8uLGZCYbL4nrzJGfSZumCtd0NuYSBFUOki9kQp
         nPzN9rbMfhhM6w552njGk44Ae7gK9qhkYIjbEgB9bJfz+lFd2d1yxi3ddqYXTctGEjBj
         sETl8XGmYoZNO6gZZO04C4BWDwEpBTJimytLSyCFdfsDZZUvTncU0svB3NO9rt+UDxP6
         uSQ+pKC83fytNxExU/E/Ye96DArq7K19tYzTLxwUDw+Kihh4wLCj23ySdYDPbJWb9HLU
         GLOQk/kbEAZhmiD42XIuH4/yeKB0623UoScwUt4JbaPBX4M+JqRxKixuiTqlfMu/rRLg
         BVfA==
X-Forwarded-Encrypted: i=1; AJvYcCU+u2u5Z/YVbFanDZ7IJOlXf/p18LZablWCZTgK/fPf01Syy3xmmElfv5zRuAhWaWwKImQkWDM=@lists.infradead.org
X-Gm-Message-State: AOJu0YygxPWrEoseDdkBWE7dRwKp5JEL/qYMGq5vokl49GcCOW/dmnFF
	Qq+sh3gVmxEv7+u+d4LkeWtnixMKww/T9IQpXt+R940kzfdtqZVzI1Yo1o/UV6N6NLoHzpxYg24
	/YTLffmAgGi32Zoh7ZiUx7v72Ysd+Gu9ubM2GcUhlceA5Km71sMwwlYJQBhVL
X-Gm-Gg: ASbGnctum1XstN4mYSqwzCc7QG+GrpkdOL5s8joZr+7PzkDQnEfxD3rlZyC4iWljUfT
	RwozCX64GSNqXoJM79btWHBFfewBSCjLk8S0fL0k7n9nOOLSDiXxojf/lcpcozZxLT8Fdu20Z/x
	LjCjgygbwnacvmxqx796sRra5fRvv5g1dXO2JYygRiv2n2wueXqWViS9LrBLjFniBoSDrNDESaL
	/9PbkOZTRMbK8vaR+3RR7ePoCPi2HvK+6BAAHCtHbB+GXkKHQSW6thN6nd6jYVn7WIGLv/CB01z
	4vFtrThdPH7iD/QTLM3kf9GpreZTddySjmmaTlMTr1lT8JkJykB1s6IF4UzYlR6hbqIxVNGdjQ=
	=
X-Received: by 2002:a05:6a20:12d5:b0:1e0:cc01:43da with SMTP id adf61e73a8af0-1ede80ecbebmr1716016637.0.1738719853516;
        Tue, 04 Feb 2025 17:44:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcvrqSxuEOrYaUAGZfQeUUGM7t1FAafbakDitTpYHT4O8gxb/KoJm5TXE61Kmf104Xes5tcw==
X-Received: by 2002:a05:6a20:12d5:b0:1e0:cc01:43da with SMTP id adf61e73a8af0-1ede80ecbebmr1715991637.0.1738719853133;
        Tue, 04 Feb 2025 17:44:13 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f109786cfsm10499915ad.12.2025.02.04.17.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 17:44:12 -0800 (PST)
Message-ID: <f82f033d-e399-44d4-8291-5e17fb42366d@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 17:44:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] wifi: ath11k: fix data out of sync for channel
 list for reg update
To: Kang Yang <quic_kangyang@quicinc.com>, ath11k@lists.infradead.org,
        Jeff Johnson <quic_jjohnson@quicinc.com>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Cc: linux-wireless@vger.kernel.org
References: <20250117061737.1921-1-quic_kangyang@quicinc.com>
 <12fad7bd-86cd-4c93-8fa2-35ec7b10f5e7@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <12fad7bd-86cd-4c93-8fa2-35ec7b10f5e7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MratQ48S6_Vq-3z-ocjJTkRMO8_tARPJ
X-Proofpoint-ORIG-GUID: MratQ48S6_Vq-3z-ocjJTkRMO8_tARPJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_10,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 phishscore=0 spamscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_174416_544396_55C56DB8 
X-CRM114-Status: GOOD (  15.52  )
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

On 1/21/2025 12:00 AM, Kang Yang wrote:
> On 1/17/2025 2:17 PM, Kang Yang wrote:
>> Currently there are two threads to updating/fetch data of channel
>> list, and there are no synchronization for the data, it leads data out
>> of sync for channel list when doing reg update.
>>
>> So change the call flow to make sure the fetch data running after the
>> update data finished, then data of channel list become synchronization.
>>
>> Note: This patch-set is an old patch-set in public review written by
>> Wen Gong. Just continue sending it for him.
>> Link: https://lore.kernel.org/linux-wireless/20230329091235.19500-1-quic_wgong@quicinc.com/
>>
>> v5:
>>      1. rewrite commit message in patch#1.
>>      2. update copyright in patch#1, #2.
>> v4:
>>      1. rewrite commit message in patch#1, #2.
>>      2. use list_splice_tail_init() to move list entry.
>>      3. use data_lock instead of adding a new lock.
>> v3:
>>      1. rebase on tag ath-202411251703.
>>      2. add KASAN BUG report in patch #1.
>> v2:
>>      1. rewrite commit message for patch #1 and #2.
>>      2. use a local list without the spinlock held for patch #2.
>>
> 
> Hi, jeff, aditya, vasanth, any comments on this patch-set?

Now pushed to 'pending'


