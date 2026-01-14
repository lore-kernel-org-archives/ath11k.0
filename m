Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D2BD38FE9
	for <ath11k@archiver.kernel.org>; Wed, 14 Jan 2026 16:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhlm7w5XQ5aGbGz4HNY8lWvxOeoJHGqdxG/3+1jCylU=; b=H6L0jIlgbH17U1idXjG3vV5MEB
	K3smJlhXRQYimSoVYVuEVro18k9qRJrRGKFC55TrWej+vicsMVTkEm2gy8pO7TOgUSINb3tGjlC+I
	1nAcMbiC1zJgQSq7Kyitiv1f1Qlx4BSB9QPA1YYU5oA/gZQO2J3drqjwfoKKUbF+6EJYrzKsJCt+b
	T/s5d/LMFxW7C0CCO2qstAW9+t9sbJb7MQzenQC1dEvjJUhtSsJZrdhbr0oBmdENIds9fQXkHAvoy
	e4HAvflaobNvTkYNYf1M1gZNie2e+OLwr+xN69aLhalhnjYYBuIUJ/6ob3kKVQSp1r+zaJSyN49Qg
	r/4qPvhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3pq-00000009wdu-45Of;
	Wed, 14 Jan 2026 16:35:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3pm-00000009wcz-2lEB
	for ath11k@lists.infradead.org;
	Wed, 14 Jan 2026 16:35:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EB31ai3279778
	for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 16:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zhlm7w5XQ5aGbGz4HNY8lWvxOeoJHGqdxG/3+1jCylU=; b=nodSYOXGr4AMOq2j
	XvP9bAXpMpWJszXB1NYC/kFjc1P/75P/1dPmrJNIv+P4T3wyJDllkYOW7fVliGOC
	6BeCsnmqTuFtA/gBAWDXdbSA2vbW6qIa/OHcoL9YGZkigyb05ncz371tBz1sVnyD
	g6xER8l1DsvoHZy/7bhWDbPYgJ4KcyyEatq6/FVbveZSkdu6rzXeQqse0H47HX9V
	S4+TQS6Rgk+wC4U4ZVwtAseBZnZxVSo2sow3cmaLl4e31tq3chkUifkQXJr5eTF5
	fxwPtBclagT+a34tDOZq5ygeqGjsDMcebOQ08d1PZE17UCq0eys7HTbM+lT6WDvI
	cbfpRQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x8s4e7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 16:35:01 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1233b81a92dso371186c88.0
        for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 08:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768408500; x=1769013300; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zhlm7w5XQ5aGbGz4HNY8lWvxOeoJHGqdxG/3+1jCylU=;
        b=XltJhva7FJpeShnejd//4uSiuMC4+0BPvXisGlEg3d5fHKGrfC0jdAtIBU24JaZtm6
         KcvSnK8FufG5YR9UCOyUVooPIYmcUHKW/yEGuVvaX7Uygy/AXdYnEc3CCA8swLvh0Amy
         nQro+WmznKg91zW0sua1+ngIrFbOpdy9WNmnEmzILNLrGk2rhautT15plE4SIvvLFYDF
         hxjJglUXk5LjwwtdMzOv/ZAbE/amh9X/75pbplC2yExIrcH+IjocqGudjyn/CBL5rNtv
         70jFytXiYtFLHN2eZSIx/6ayNukjB/53YYZusgadhH2OhdRFcTSKgk/0pwohSa95DfBl
         ioMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768408500; x=1769013300;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhlm7w5XQ5aGbGz4HNY8lWvxOeoJHGqdxG/3+1jCylU=;
        b=Y9xGVevM+DKUOhzdXlB2FoHr9Xgilj58/w2DHxARdE7nGrfb2OI5F9TxqENDx1nq5L
         JwFU88KII3Gd1M9zGypo5ZlzdyPrBeGbReaqtsP7Cdyycjg1ZB1Bl5p9laSAoi3IowgH
         oWaeqdhMK+J+4U9oh2p4Q5ZTsoed/g0sDQiouemA68ITIJaphK6cO9ww19Fg32XnSOSJ
         rjnka5Q5GzcOXRj11AsCuzAqCbWJ5BEfcoHWKnFFKCuPOF8S2HWOnd1QMNpMA8oQORF5
         JWSCrWSVKtNQtbDbQk78on39T65FQkJi2v3lqx1kQsQFGnvkswTL5dSXJU4eK7Ajb3k7
         j5Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXrHgnk9huRy0400WdTFjvhePJc8hLd/VjsxY8P0psgxylcn533TuZ4Lq0E3O5i/I+RR3O9mS0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxebq5QAaDezDL0hrlmdgUDuiJb1oNxenAYZvQxK2owsIfdtl+r
	jekMNZvC069b8GKUYE3FfCe1TmUB6ZxaWGVmp9nHMAO8w9WwTDjlfDft0cmP22P3/+otCrSqhG+
	ev/gQK/cbl4e81OeoL2qS/3yOm5g2+fm8UAIkaY7SCht3b9oTUXX7UTTyw35pW7iS
X-Gm-Gg: AY/fxX4K9PYVX90jyWpj0Ih/B/xD8VX7c8UfW8+oMaCPlsyctDpFFVbk9o+LdA2DS+p
	WU/EQAcP5m3TjIZSGB1Kj2VKcrgRuI5YOMyBH/XBzb/18OuPpHd0E2S+Fng4o8deLOsB1r4bVXZ
	kPIth2FH9+h3hFQY5phuP72ByAZwfiezJvBsAYXKvMCXtk3+iOniCO+100CMHIkAxl0r5rq+Rat
	qfSW+s69zVbCrGXmrJs5pzf6t3YA+ptChwU44+v7RzgjRB3gEcKjSkFVs0y/Wiug+sX5xkuYvCw
	PR1/MEXpa2TUJ89gzSk5bLwxMn9m0UpIdC6cL5VvpDed0VbEsw1M6AqPUkUTTgiZI1bmCeW4dI1
	2sqvjLX6nOf9ueYFfeAjbDXhBMpEzVHWPZ82ksdJHz4dYsKLdbQqeJvGpTZR5jbjxYZ6w9Q==
X-Received: by 2002:a05:7022:6182:b0:119:e569:f86a with SMTP id a92af1059eb24-1233cfed5f2mr39385c88.7.1768408500308;
        Wed, 14 Jan 2026 08:35:00 -0800 (PST)
X-Received: by 2002:a05:7022:6182:b0:119:e569:f86a with SMTP id a92af1059eb24-1233cfed5f2mr39333c88.7.1768408499655;
        Wed, 14 Jan 2026 08:34:59 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12316f2db84sm12303009c88.14.2026.01.14.08.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 08:34:59 -0800 (PST)
Message-ID: <a47cfe9f-01eb-4cdd-ac97-421f3c8a3451@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 08:34:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath: fix comment typo in monitor mode handling
To: Chien Wong <m@xv97.com>,
        "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Cc: linux-wireless@vger.kernel.org
References: <20251030143041.12027-1-m@xv97.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251030143041.12027-1-m@xv97.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GIQfyzUiIRhBrGcIuqPc50fZdMggMlpo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzOCBTYWx0ZWRfX8anCai0H8ntT
 sGuWLDeJtzGtLMQuSquNFZeinSv5azvjcAavLZOm76TmA9L6we+BKNr4Mz/J0y4DXd++2qLFRRL
 UtPPsqqfgzYD1O03aAOGfcmqDSlZUfy08M/GOpLK5/Y8oQPArIma2QAbWmdUx8hsqCmwsb8Cxxm
 PTHMcDe4vb6NX2LNr9u28knTUqOHRuRfiUUayRh3T9XXTygyNdAuV8EvnQA6n1lWoEekEcrS3Ue
 dnXXgLWTWB7zdyvTy09n4FPOawTCpwnJCTGoEKD9yew19H64MDdQ7yzGx5GOQwtW0DReyiRdD8F
 NMbnKoV0oTuB7LoKM7iJIYeDAJ0HG8q8Qxu4qYumc4XThAX3MgNNHhf/McwkG8DI6AabQ5ew2Mn
 r/rtms2xpTvTZaAV1c3eyjPoHqGTRK4jDNzdwiPGFlHwEbBQggproDygJfp9ONMo6m5eDQE2pT5
 RedPXcMwyCis6cntR/w==
X-Authority-Analysis: v=2.4 cv=HY4ZjyE8 c=1 sm=1 tr=0 ts=6967c5b5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=1_aVZONaAAAA:8 a=Ps-XcboYn3Tz16R_CMgA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=AoRcCS2iqqjlCIbQeai0:22
X-Proofpoint-ORIG-GUID: GIQfyzUiIRhBrGcIuqPc50fZdMggMlpo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_05,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_083503_605140_1CD6F191 
X-CRM114-Status: GOOD (  10.89  )
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

On 10/30/2025 7:30 AM, Chien Wong wrote:

Subject should have use "ath11k:"
I'll fix this in my pending branch

And I've removed the ath12k list and added the ath11k list

> Correct a typo in the monitor mode comment where "it make" was mistakenly
> used instead of "it doesn't make". The comment explains that the brief
> period where monitor mode appears enabled before being removed is harmless
> in practice.
> Also, use more common phrase "in practice" instead of "in practise".
> 
> Fixes: 3f6e6c3291ed ("ath11k: disable monitor mode on QCA6390")
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")

And I'll drop the Fixes tags since there is no code change and hence no need
to backport this change to stable kernels.

> Signed-off-by: Chien Wong <m@xv97.com>

