Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B87CD37AC
	for <ath11k@archiver.kernel.org>; Thu, 14 May 2026 04:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuLPtwpcvWP+BVIoZY2D5pGrjRu1PqelS3IjJR6x5/I=; b=1UoaLkiMKyMw9MbvuGCrBkc0LW
	3aT3CsMTYdJgHKUCTDJSd5pefWft/2KvroYE9ZENuQ9UPG6QXV1fuTdcVjKz2Y2wF+l24eaHRkq0u
	kGtHymlI00Ia/JOuxSPiBRYtprRpODUEh8S6PvdpztsmuKvoAX1VdqQkJGphR1AGOSy8xRbaGAYkh
	teqEMfbP4fD9BsTRqxa5e/GE8NWXlfm3PQA1412RtvwXKYLExL5qYd7m0ChgepDA1uHotAKpch2Uy
	Wri9M3aFGJocPqEPVlpPAseQt6RUZ+6vpksKXu2/ZpVmeWoVM0loBOmL1m22cL+Eg+dQC/3gUjDjN
	gMM4j2Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNO5y-00000004ZYk-1yN3;
	Thu, 14 May 2026 04:54:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNO5w-00000004ZY3-1HJg
	for ath11k@lists.infradead.org;
	Thu, 14 May 2026 04:54:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E35KgL1096436
	for <ath11k@lists.infradead.org>; Thu, 14 May 2026 04:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZuLPtwpcvWP+BVIoZY2D5pGrjRu1PqelS3IjJR6x5/I=; b=ZLXLvucVCuKvR2EA
	cfvmI3H96Hc4yjIkK/XsZUL93fR0yHnNMcWX/ovEdlcP/9mDz9cBP7uW2eRlTEGo
	krf1OeTikpI6HNfEjAtwtFfRf8+l8CMs/xDP5QC98PkBM1NN61M6ubCNa+X9aqdd
	dyYyMkUfLwWyS8oAozzl2BoHPUrnUWb3jVdaQVA3x3V616GfMDdO5yr9uUsrVXKb
	fyzuc6rgGJrnjzwygrJy2AnqlkptngTGsPi4zXxf2IQKqcWofbruxNislX/LAd2e
	g1n6JIbhTLX8e1z6hkCdP9zlgHU0yz/bEOalhdkH0kAl8untSBAL6Cm51779qXbH
	wut09g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e566bg9hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 14 May 2026 04:54:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baf7378ad0so63320715ad.0
        for <ath11k@lists.infradead.org>; Wed, 13 May 2026 21:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778734486; x=1779339286; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZuLPtwpcvWP+BVIoZY2D5pGrjRu1PqelS3IjJR6x5/I=;
        b=PCFrm3ex1rU7jYmU2tdhBIkBz1OtwixCqsh9riA7/8Y/rph7W6s02rwjvniuecrESD
         PIhaH1J0TRB1YKq8yTbO14jbq/1O/anv9L5XNmkp84q0TdIylf20AYfie6coyCYUDuQ7
         XG3xgo6NpJrS4L0M5QPeHrPhN3ZARQIwr17WOLjqt8UIkpMgrFvdqvQz2fNp46UEN7TF
         KilUTde3fHst9LW2iuG85NlX5Nev+iwIDPjoX41fxdAkkmJmdvXovpetdgdGyovSoYnM
         3LJTbFGUXYKPy2aVxPENVM6I9tV+l17o9zHC9QFYoQNSf5V4GtfO2Ig6G2teZX0L3y8Z
         TbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778734486; x=1779339286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuLPtwpcvWP+BVIoZY2D5pGrjRu1PqelS3IjJR6x5/I=;
        b=Jt0A1N2/fPgfdgz1Uid5zshbzOv84TCL2tZI4XEwi5WRwJ1gHbTCq5o41kQdvbR87Z
         FqpsQzWfX88Ft1nfDFlJP30e/V/Md67mUD6n4zjYtuHtK923p04XLXT9qjzjMVsU2En+
         xnu5m7mVoELuLdSS94PMXCn2cnXe0SjBk3etxDPuuwPnjZXkHr7DrkWOPE85b2Pi6iFX
         ZFnfaoeI8g/pO2wr1cVZ7j+AteGVe27y1eqVvZLoQGEnxGbPU4B9TmmRLjcH7K2FhzvT
         VxXHWjabk97zu37+kch/HSKdd4jjFnK0zg1lytNgRfavFC02DSO+JWZ9wByqiXwHwBhe
         NE6Q==
X-Gm-Message-State: AOJu0YyZcL3u6kdsuLz5Lc0jfkjJ1ztBAroAg+r2v/b0NDjBahbb8N6g
	poaisIh3gF0QEAjlLKGLx0QP3/t/i4/jSGQCmhi4fba+FSZlwNsOOTL6xS7CL5XHWa84TRSBOY2
	BB3uolJyMuCNgo3ZkXRxGWp/oZYtG6SMxyH4EpuiGSJbXk31hADja2gUY5orJXrqL
X-Gm-Gg: Acq92OGUbYJlzeoPbvGY4o36HzRghUeL872cPGtayjBJLjW2gBBUNhbyIKNqejffqTR
	OAmy4Ta41Oj0ttTsN24KHwK/gX/wfSLNHi1KvySJJgmEsY79eWibzxCdqgO80ILeFueM5K5dT2Z
	Cprv/s4ZdbiskgxEeW5SNsUR7+REpu4PECLStej2J01E2OKYCKOZi3FzkHQaxVcOh9zdmUt2G1M
	KxRVkNIVHgVQ7FJwqldmgiDQzGeL951hDoaEsWky5arclOqiBKOx227LPnocRxmMwwrdY+6/pZ8
	THbiYZPljPgnIKKJ0yEP/uYEfjOP/Huo0dtX07FOvanip8T66BSITLy/vkAusv09eTcIilo+DsI
	VPdrw/j7kaYPwLHL0wrDIz0ow0n1tBXGltMcrmMzl+HdCYnzoOZ5Y2AADKtxQB9I/7jHzgxpG
X-Received: by 2002:a17:903:9cf:b0:2b4:65d8:6a20 with SMTP id d9443c01a7336-2bd2f4cc122mr55750075ad.2.1778734485577;
        Wed, 13 May 2026 21:54:45 -0700 (PDT)
X-Received: by 2002:a17:903:9cf:b0:2b4:65d8:6a20 with SMTP id d9443c01a7336-2bd2f4cc122mr55749805ad.2.1778734484963;
        Wed, 13 May 2026 21:54:44 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe6512sm9094395ad.52.2026.05.13.21.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 21:54:44 -0700 (PDT)
Message-ID: <324401b9-f6c2-4d2c-92ba-659f78b4ef6c@oss.qualcomm.com>
Date: Thu, 14 May 2026 10:24:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix warning when unbinding
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath11k@lists.infradead.org, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        stable@vger.kernel.org
References: <336655c6-4dac-46e9-a783-549f0a9cccea@oss.qualcomm.com>
 <20260508103202.456865-1-jtornosm@redhat.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260508103202.456865-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QLKMARIyhbswtxcDKLKlTSQ3huYUKX1x
X-Authority-Analysis: v=2.4 cv=WsMb99fv c=1 sm=1 tr=0 ts=6a055597 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=M0CKB0vJUJO0TNvbIsAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA0NSBTYWx0ZWRfX6y5FsN0his6H
 iJGKu/yqz2LD6SX4pJRaoQYIMAdcA9zjuivcLeGgXa/r29EkmtG00w3nS+7IFt1dDdAUOU63Cwh
 LIBCXOUwGIRjo2Bj8HBW6AsHYutQ0hDU+GyCd2OLHuxLBkEexp/b28boKBzu3+cF3L6O+UguUnR
 a2xQgPCJYPRiaCoQloxbOt8kvMwIuHpGUhr1J1qIomis2FqC8pCVqbUUqpHWvAaPVV5x5IecBnb
 aHsrSLxsEMu0EsKinIp2Vhtt+PXqxPABZvqYqPLeISQ5wGhfnORbwuktHkWkmfKxTz6sx3RNxSB
 58txxNPOylJUTYBkb9YM4P5mzPJNgJjv8PVxsIGEg75Id/6a6+sM++X9x8AXJMC3ZFB47IUr047
 bWqNZJVgbimwencVQ2KP8ZPtdzEG7TKAuNGbcaBCBrr8a+432fm0bS9NqUUb0Csa5wAYjjJm6O3
 nJT+PQlH6OTLU3AlCpQ==
X-Proofpoint-GUID: QLKMARIyhbswtxcDKLKlTSQ3huYUKX1x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_215448_465984_ECCCDB70 
X-CRM114-Status: GOOD (  17.09  )
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

On 5/8/2026 4:01 PM, Jose Ignacio Tornos Martinez wrote:
> Hello Rameshkumar,
> 
>> What is the exact failure? Do you see any driver error logs when it occurs?
> No error log, just the warning.
> 
>> Got it. I was just thinking along with the proposed fix — whether we
>> might also need to handle the sequencing on QMI failure.
>> In other words, do you think the issue(double free) would still be
>> reproducible if we include a change like below ?
> Yes, I think so and in addition the code is more robust.
> 

I agree that setting tx_status to NULL makes ath11k_dp_free() more
defensive, and it matches the ath12k fix.

However, i am still wondering how the second ath11k_dp_free() is reached 
if ATH11K_FLAG_QMI_FAIL is set.

In ath11k_pci_remove(), when ATH11K_FLAG_QMI_FAIL is set, we take the
qmi_fail path and skip ath11k_core_deinit(). So the normal remove path:

     ath11k_pci_remove()
       ath11k_core_deinit()
         ath11k_core_soc_destroy()
           ath11k_dp_free()

should not run.

So if the double free is still reproducible with QMI_FAIL set (with the 
change i proposed), either the flag is not actually set in this failure 
case, or there is another path calling ath11k_dp_free() ?


--
Ramesh


