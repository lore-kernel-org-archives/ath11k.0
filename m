Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2994AC43458
	for <ath11k@archiver.kernel.org>; Wed,  1 Jul 2026 17:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iS5vtTLQxJ4op5FEDuxp3nMiGG9OS6mVarK5ICm9UAU=; b=eumF6YD9mSGog7P0mbMODLOfue
	X0vseBIrQe3E8OVaEWDM3cbjkTuurTSeQ7Zz9tC3/sRzIf8MJY+q9KQ0ZoTlKYUF6Co6aZ+diug/y
	q0wq/iNL/hF4PFU16Vayh4pqVdwal3MGwMP7rXwhqPq+7mFqzgThLiYyOv372GkcoiYGFvikLu5Ha
	wDo0otqJv84CtO5LvKAIYMvxe6jOU9K6RpC/mA7ku5kNAgGX4K3oHPzEYX9W3ewRHKBEFTVuv77Jb
	f+3YTQKr9SXdeVIWwIJ79Da1QLpjoUs/4cYLlMikGrhZc3Kp6IQDiRzhijlFkzoWi7Tc6IqpDF9aJ
	+RxPmPCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyQh-00000002fkT-3BuR;
	Wed, 01 Jul 2026 17:08:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyQe-00000002fjh-2YSK
	for ath11k@lists.infradead.org;
	Wed, 01 Jul 2026 17:08:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmiAZ1708074
	for <ath11k@lists.infradead.org>; Wed, 1 Jul 2026 17:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iS5vtTLQxJ4op5FEDuxp3nMiGG9OS6mVarK5ICm9UAU=; b=ZeyOKYmqz2ir6nJK
	qKPD7WUPFIKl0j3SrJ4phD3celcOrernGQcnZzlfBOJ5oCWQ0neO2BC8jbCbZ3V5
	//cL0gzclLOwWxT34+OXsR53jpEfgCd0OIfzxdcWQQmBr7nHIhN7+3upIlDa7tN4
	h9ANvjLfKfwebJ7E//0X5JIe1ENm6Fo1PiOAUmWn9Rj3dPDgTl+mhachxeEFlB9D
	C/mbemb4bUXEEV6XGljcK7Cg7dd+4s0DZJj/XLNAmAvJgZxY7j2JkqpTm+zDoq6P
	vKw18bbKByZE5IWswsPGkFXjNudwg+DWnBIvQQykPxoUuT7QawaoqsieLTcaSmx6
	8h9l3w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sqsvhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 01 Jul 2026 17:08:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c8e14ebb2aso14604885ad.0
        for <ath11k@lists.infradead.org>; Wed, 01 Jul 2026 10:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782925730; x=1783530530; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iS5vtTLQxJ4op5FEDuxp3nMiGG9OS6mVarK5ICm9UAU=;
        b=ZIyutC37UC6qX5udyrq6sF//UOvxrklWOY3UcGuKZuU1EPwUeg26vr00jW9uGtmKQP
         abKYzSWhr0yjDE+AxNU/reoZHqJQKenXoDATQr/UeM+++cNoEmO3bK1SmHPgeeRyXHf8
         KOEHDQEZD1h3lf+8o6f4rziIQye1a8LK/s8CXFwK7Sv987SB/f9s99gCTKYmdwYNxRBG
         eqLrLbtL1CVZte5idXMrgNwP1Na2yGXf67lkQRSmuZqtPwSnZTCihOgPsFA1VyXR825X
         7MTw0fMBp1I/FmMREIzrz1HQXT9gW8hGroowUpK3qVLqBMNediRR8JmkYFpnjCwJXXpO
         tTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782925730; x=1783530530;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iS5vtTLQxJ4op5FEDuxp3nMiGG9OS6mVarK5ICm9UAU=;
        b=Al9IJWVgk+dcYX7ANJkVa/7cHpq5AbaJgRcKFvjFBoSLb6Dsh5jvnv/L07Ih1yeE5y
         wm4IG9gzEdXYXbsoLvXJIzFoQ+XeZ9Vz29QbWBSvWQ2OCFdOSDS4xDhUEphJBVKIrwkT
         VYhoZYp3A64NGR/2fOfHnhNjR5gPnoYOVm1qJ8zUMt7kzbCRQzBL/hPMzTAcomhXMZhD
         uussoRzZtJgu/gQKsKiTE7fZHygCP2dnm7LNxB9magwZQ6JzRRX+M7UjEQCk4C7EUcf6
         JX4yXpcYzi1pu9dm0rfWR77jPh20VTyytq0CAoy8UOcCo8H6B6vOa6V3vSOmwRmoCGqX
         10HA==
X-Gm-Message-State: AOJu0YwAnjs+HtfFGhDfSm98+5r8NDXtQcQTVuW2MUA2m1Lv1Ay84C7b
	Vo/7n29JgGbfihFIs6dKDIgrCWsq/0B5vgX1c0T/1TDfRhcdX0JwJbxtH0ycyDo0SVh2BHXm+bP
	QiLLamdpYdONs4dqOwSEy+lvmuH0D+16UyBTB42OvJcmUSFeomAs0HCNQkeGXQzs2KhMxieye
X-Gm-Gg: AfdE7cks0hYUATDRIz7t5apk7LcFmWcy4fl51//pYjX8INRxhVBwE7NWwcXNBGXo60n
	XDEjWziUfW8bKvUr52p9M8VNzGVHbkEv9pnrf3hls2Px7cdrKlztVUbBXTNwjZ4UWIEz13cTzcP
	RGyfJrInhAkDc2X6OHo8JQg5qCu5lLgwnLLrS2MSaRPPL+3+eTTDB8EAOSgGBt50SKnGwgbtVE+
	wPdG1oOrY92Gh0w/hi5Vz4uPqN1kBsxcRl7ChIAnGqsFSrRecm7hPQBCYN2B4T3cOMz4MA66hJN
	CUCujL6hSW6IUe5p8/RJXvSnNyZcuir2tAuqZVw4OsPMJ2jijjo2J8/Fa4siJvVBU/ia1zCn1nh
	wxBaJPt0oW21JLpwBpuu29CgDSR8VxrZv/qhNsclD10VCZspns8haVp41te0HpEmdAubq9Bc=
X-Received: by 2002:a17:903:b0c:b0:2c9:d584:49bc with SMTP id d9443c01a7336-2ca4487f865mr59166405ad.3.1782925729720;
        Wed, 01 Jul 2026 10:08:49 -0700 (PDT)
X-Received: by 2002:a17:903:b0c:b0:2c9:d584:49bc with SMTP id d9443c01a7336-2ca4487f865mr59166005ad.3.1782925729203;
        Wed, 01 Jul 2026 10:08:49 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2a9b425asm27631455c88.0.2026.07.01.10.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 10:08:48 -0700 (PDT)
Message-ID: <a412f206-e856-47f8-af74-8eb268ed50d0@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 10:08:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k: BigEndian platform support?
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
References: <68290980-5bfb-c88c-be78-954f9591c135@westermo.com>
 <87cz0y96j1.fsf@kernel.org> <akIuPiYGXDbDWLGZ@FUE-ALEWI-WINX>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <akIuPiYGXDbDWLGZ@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kKMHoHz2rwuyT1gD9OsBr3q3crisliqi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE4MiBTYWx0ZWRfXzi65YT5Slmk8
 D4FwGgAZRbdsIpM3kyAD0ioMqmyihLbT85zbzmRMqsKEo24/lNdKhM7L6HaZ7RlIIoduSj+35nO
 /LxUew2qpWHpqRrmCn8ac4pRWbhwnWg=
X-Proofpoint-ORIG-GUID: kKMHoHz2rwuyT1gD9OsBr3q3crisliqi
X-Authority-Analysis: v=2.4 cv=ceHiaHDM c=1 sm=1 tr=0 ts=6a4549a2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=N9GNhs4bAAAA:8 a=ZRmf-2ApCqndCitTYBsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE4MiBTYWx0ZWRfX6AdltXSUMPG3
 zL3WzXuo5uyYkLOYNE8swFmkKVz2diLZ7PfKw7jex+TJnzX13NUpaXG9AQgJttPU5WcfzG/8/W3
 Rj6MljRkwRFhXwH5cMlqVqwf/KvDtWCjhAFoXELpLI9BPCQgF7MX1FQZH3o90i1J5oZb+FAnMEE
 p2TtgPque/PU6Y3zCIkN20c59NcUNJCBRckdcPMyXYVMJmiORtvveKL1e5CsiMm9ywyC9QEyz1Z
 upRooisYGKe54lXuct18Q/mKtLe7sFzuuO9Tcc0QHv1Uhsf69cIIYrON0NpZiSrlTVQVFngii7P
 7misKkU/VCDy8a8RgG2vev+IWqZUy6/abQR3zqRDyNDtfZuHPQ+Uc4gJ47MYag5FsrAgTLiWhgd
 B7tIPVgc3EVVbpX+P2yoMUgCh4Ew0UTBYuOtJ4CJ45X2QUhvkdygRR2fJvE1V5oBB5i0SIhDHvQ
 xFBw6IcjNuq/5Vgwu9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_100852_760552_D5D726C6 
X-CRM114-Status: GOOD (  25.03  )
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

On 6/29/2026 1:35 AM, Alexander Wilhelm wrote:
> On Tue, Jul 11, 2023 at 11:49:54AM +0300, Kalle Valo wrote:
>> Alexander Wilhelm <alexander.wilhelm@westermo.com> writes:
>>
>>> I am trying to get the QCN9074 module to work on a BigEndian PowerPC
>>> platform. My question would be, has anyone done it yet? If not, what
>>> kind of effort would you estimate for porting or are there any
>>> firmware limitations?
>>
>> This is a good question. The short answer is that it _might_ work with
>> QCN9074 but AFAIK nobody has tested it and I'm not really optimistic.
>>
>> The long answer is that the big endian support in ath11k is implemented
>> in a weird way which I regret big time. The idea is that the firmware
>> does the translation instead of ath11k driver with this flag:
>>
>> /* Host software's Copy Engine configuration. */
>> #ifdef __BIG_ENDIAN
>> #define CE_ATTR_FLAGS CE_ATTR_BYTE_SWAP_DATA
>> #else
>> #define CE_ATTR_FLAGS 0
>> #endif
>>
>> But later I was told that not all firmware branches actually support
>> this feature, sigh. To my knowledge QCA6390 and WCN6855 firmwares do not
>> support this CE_ATTR_BYTE_SWAP_DATA but I'm hoping QCN9074 firmware
>> would support it. Grep for BIG_ENDIAN to see more big endian specific
>> changes.
>>
>> In ath12k the endian support was implemented in a proper way using
>> __le32 type family and cpu_to_le32() & co macros, but it's also
>> untested. It's on my todo list to convert ath11k to do the same but no
>> idea when I'm able to work on it. Patches very welcome.
>>
>> Do let me know if you test ath11k on big endian, I'm very curious to
>> know the results.
> 
> Hello Jeff and the `ath` developers,
> 
> there are still a number of pending patch requests from my side for `ath12k`
> addressing various big endian issues. I assume there may still be gaps that I
> did not uncover during my testing. Nevertheless, `ath12k` is now running stable
> for me in both AP and STA modes, so I have started to look into `ath11k`.

Let me start by addressing ath12k. I have been sitting on your patches because
internally there has been a lot of discussion on this topic. Just this week I
convinced Those That Need Convincing (tm) that your changes are consistent
with the approach that was taken with the rest of ath12k to have the host
driver responsible for all byte swapping. So I'll finally be taking those patches.

HOWEVER, Qualcomm is trying to transition all of our products to be based upon
the upstream driver, and the team responsible for enterprise access points
believes that their KPIs on Big Endian platforms cannot be met with software
byte swapping (my understanding is they currently use hardware swapping in
their out-of-tree driver). So it is possible that ath12k will need to
transition to hardware swapping in the future to meet that need.

I just wanted to share that bit.

Your proposal for ath11k still needs to be discussed, but there is obviously
concern about introducing regressions to code. There will also be impacts on
projects like QSDK and OpenWrt, which are based upon applying patches to the
existing driver, if large portions of ath11k are rewritten.

/jeff

