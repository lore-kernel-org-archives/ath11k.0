Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CE4C369D7
	for <ath11k@archiver.kernel.org>; Fri, 25 Apr 2025 17:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RElAtBUh3JMadqAp/lUXLP08HTrrFyJ/4SCZtOIMXWs=; b=g6ryV1ttLaUkIA5eFyrnDV03ln
	yRU6SuIdy8Yurwb7q5bp980IMPKCPMpwjS1uDmMqbQ05E3Fn7tOrgEAj/oGgb8VyTv1Cu2hMpoW1k
	Us+x5ufcUGiJxN8PascEusIhLkQ5nCxG/uBI6E+bPOGhrurGiNkJmGKJcY5khwfIV/nKknFNFoLSF
	0fwMIYvjb8zBMmJHwOY2RMePL+hs0ok+FwmO68bm5H8zBhWcTGEZyzn3TxqpguOwLec+HJ7lwY+BV
	/bDGwO5VtL9yUPlyk6RB1ZU/mMXPt6vd0iXbodFlDxv2mXHayUaIkVHft6u9yDEBhUeUXOpUrHhIn
	t8sGu2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MWC-00000000KpU-1SZw;
	Fri, 25 Apr 2025 17:07:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ldp-00000000A7s-16rH
	for ath11k@lists.infradead.org;
	Fri, 25 Apr 2025 16:11:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TC7s008729
	for <ath11k@lists.infradead.org>; Fri, 25 Apr 2025 16:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RElAtBUh3JMadqAp/lUXLP08HTrrFyJ/4SCZtOIMXWs=; b=dgGaURLnJKgMlQ0Y
	SMmXUhc0Q212Ckq7NIqIlDyrfbEhw5yYmOxqQZ2wrgQtP16kvaJcaEJUGJTAyKOO
	kEpnALgq0/j15w2yKoqjxN6tJWtKy5XvcQo+Zw4f0vmmS88wKvCtNaljzb7EvUTt
	gavwdkJ4wtAwAKKmUj3UTBRRtScLX4psGEOf7vgxrvoGoEtrA6jVxOas6ot/yRit
	UxBCVOZjUelY0iu10RGtAgqPmFaoUN2hGjUMs2aIXeGkE7lHunhTYPvgLMZ3/JPo
	5kYsQZMyjaUVqmyki+h7oIeavn+TziZqbGqRXJWzBSvLaWvxQLwZwr6AHQ8j0XfM
	5JWgdw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy9mn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 25 Apr 2025 16:11:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-225429696a9so35858495ad.1
        for <ath11k@lists.infradead.org>; Fri, 25 Apr 2025 09:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745597461; x=1746202261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RElAtBUh3JMadqAp/lUXLP08HTrrFyJ/4SCZtOIMXWs=;
        b=pXKPTQudGFQF0mCQUn0UATVsggOBfoaMbzSMZehq+zmSY7VFABSIXUOCEEd8LWDEE5
         PFQntubkptlbAWDy/RpowWWsn6Pnwb/p0Wk/bzfmpIKDFnaDAN0EvYfy5VZWSYlymBmS
         HhdV8W9WdsfWwEgdKErGCjIT9YnkV8mqtA64WV6kBMbwdjicFFa3s9zmTGlVtUm8ZVbe
         Yyn5hWW7wD0G97eXPhEGH7VSvZQC6hR1CRjO3bFreXEVmmTEJlKTQxR8RqOo7ZTv5W0p
         9fOevmBuDA0NexPE8WJ9kbAAFRQrTc2FAfmEyZBhHYjAjwwrfC77LvlESK4/aLe31uPO
         rUpw==
X-Forwarded-Encrypted: i=1; AJvYcCVWoa3gabk4A5JFFJW+VbR3h9CImru73u0geujJ7zzBmlAWRqzqAPOd2K2KIy+V1Xca3s2eewM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDZ0k01jG39E7bIr1VdZp604BUfhsvB/LAsYI9YL3u9rLm3Soh
	WZNOI/F18LVaAe82cydGRvZXGQIODpikYDB8W8+hfBmZ4cFtYqbkTl5Ow03AZAazcHt+j3tMkyf
	5cOHOAVCobarVRdjtOHY5doxyeBep3EE22FRl3Y49cJ8Y+Q9dIxpD0gAlF6GS
X-Gm-Gg: ASbGncunI4ALTmGff3v1glvoUUbSECCH8gxct5LgrbsC0oE8T8GTuk/zXY42C5EC9lI
	sElktRliEpsanPE7s2H4U4OstCyIGkOBwUeWO1l3N0/2QXryDGUCaLyb02687iheDr+AF+S/M/E
	m4eK2kPbiLJIIPJYdP6He2lGMduIv2KIS08U9JGLX6IT/t+Vd9g4Lkn9NOChLhK1b6z7v6/kTox
	Kwple7MqY0wwYCFLD+Tw0Q5Ru4dBFcCOLHgFu9IbF/oBSI3Xs6jZ5SKoGPTUsYvoT2V9tv7fLa1
	i8nWs86A1uaYz5fWa9kKVWHw1SiW7cWtXk0PI3M9OahTs4oYnUTaMYCuxk1qBQ==
X-Received: by 2002:a17:902:f687:b0:220:efc8:60b1 with SMTP id d9443c01a7336-22dc6a684damr2158295ad.39.1745597461467;
        Fri, 25 Apr 2025 09:11:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+iKresbEHMCAR10tWIKzWkb6iN1Onwn3haKXlAZ0Es+wfyOdv61jmnXzmWzIAafdyl8Xpzw==
X-Received: by 2002:a17:902:f687:b0:220:efc8:60b1 with SMTP id d9443c01a7336-22dc6a684damr2157905ad.39.1745597461048;
        Fri, 25 Apr 2025 09:11:01 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22dc5aaaa54sm2693295ad.227.2025.04.25.09.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 09:11:00 -0700 (PDT)
Message-ID: <3ceda07a-7261-48c4-aa60-fd5ad83ebf34@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 10:10:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        ath11k@lists.infradead.org, jjohnson@kernel.org,
        quic_bqiang@quicinc.com
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
 <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
 <qhoirbfx5p23542hhi3kk7ftwtptsnoxgtewddbh322d74rgb2@xbupxi3ix7sx>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <qhoirbfx5p23542hhi3kk7ftwtptsnoxgtewddbh322d74rgb2@xbupxi3ix7sx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDExNSBTYWx0ZWRfX+wEX3rt4bCtL S58QIs2QQ81ujCAQtDBVmkpJUOEQBRhNcJjDDP2fEBHJjb8+2EnlBaSzlkk1pldoh3h7S4+1uwK SpqeDRqGEduO4btAlw4ZcE3rqL9nv/oPGnwLWB7rgktSFNj1X8zKNrMtAJZn2P4mj/GHEQikGMc
 Is8oSvBtupLF9EePny2bIye2PPXHNSt4xsd+wqX4ePXTjhYiSbxyQV49YAqLWcM36Xez+3XtT1J XHvGA4iICKUTK+EoqZxa2Ii/LQnDCwuhF6eo8reBDnK0s6TL/a5LPg8tu2tUs5kEUorLtCsqDml WJl+4a9AR2Xx9IDLMKXhWdJHqEUQxICji5rVQA6ke7ThmEBeYwha4iZPTc16lsiItGlx+L+FPGT
 YgHlmmivrcPWq/6u9VTkugaFGBLNIKKwrqfxDaLFTRTQ3er1hGpojK17JWLWDk2vDiLCk59x
X-Proofpoint-GUID: UFZTuZq1vbYsU3ZS6egtlqPLDXf6iEWh
X-Proofpoint-ORIG-GUID: UFZTuZq1vbYsU3ZS6egtlqPLDXf6iEWh
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bb416 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KGs-PxyYlbaIbUy0pvQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_091105_430249_B6283792 
X-CRM114-Status: GOOD (  37.54  )
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

On 4/24/2025 11:37 PM, Manivannan Sadhasivam wrote:
> + ath11k list, Jeff and Baochen (for question regarding the use of reserved
> memory for allocating the MHI data structures in host)
> 
> On Tue, Apr 08, 2025 at 08:56:43AM -0600, Jeff Hugo wrote:
>> On 4/8/2025 1:01 AM, Manivannan Sadhasivam wrote:
>>> On Fri, Mar 28, 2025 at 10:59:13AM -0600, Jeff Hugo wrote:
>>>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>>>
>>>> MHI control configurations such as channel context, event context, command
>>>> context and rings, are currently allocated individually. During MHI
>>>> initialization MHI bus driver needs to configure the address space in
>>>> which this control configuration resides. Since different component of the
>>>> config is being allocated separately, only logical solution is to give the
>>>> entire RAM address space, as they could be anywhere.
>>>>
>>>
>>> This is fine...
>>
>> We tripped over this when experimenting with an automotive market product.
>> The FW for that product had a rather strict interpretation of the spec,
>> which we confirmed with the spec owner.
>>
>> In the specific FW implementation, the device maps the entire MHI space of
>> shared structures in a single ATU entry. The device cannot map an entire
>> 64-bit address space, and it expects all of the shared structures in a
>> single compact range.
>>
>> This applies to the control structures, not the data buffers per the device
>> implementation.
>>
>> This restriction seems backed by the spec.  I can't find a reason why the
>> device is invalid, if limited.  I don't think this should break anything,
>> but more on that below.
>>
> 
> Yes, atleast I have heard about that limitation before.
> 
>>>
>>>> As per MHI specification the MHI control configuration address space should
>>>> not be more them 4GB.
>>>>
>>>
>>> Where exactly this limitation is specified in the spec? The spec supports full
>>> 64 bit address space for the MHI control/data structures. But due to the device
>>> DMA limitations, MHI controller drivers often use 32 bit address space. But
>>> that's not a spec limitation.
>>
>> Its not the clearest thing, sadly.
>>
>> Document 80-NF223-11 Rev AB "MHI spec v1.2" Section 6.2 "MHI Registers"
>> table 6-19 (page 106) -
>>
>> Describing MHICTRLLIMIT: "The most significant 32 bits of MHICTRLBASE and
>> MHICTRLLIMIT registers must be equal."
>>
>> This means we have a 4GB range (32-bit) to play with in a 64-bit address
>> space.  If the upper 32-bits of the 64-bit address for both the base and the
>> limit must be the same, then the range of addresses from the base to the
>> limit can only vary the lower 32-bits.
>>
>> Invalid:
>> BASE: 0x0
>> LIMIT: 0xffffffff_ffffffff
>>
>> Valid:
>> BASE: 0x0f_00000000
>> LIMIT: 0x0f_ffffffff
>>
> 
> Ah. Didn't spot this before, thanks for explaining!
> 
>>>> Since the current implementation is in violation of MHI specification.
>>
>> For example mhi_init_dev_ctxt()
>>
>> We allocate the chan_ctxt with dma_alloc_coherent() as an individual
>> allocation.  In the case of AIC100, the device can access the full 64-bit
>> address space, but the DMA engine is limited to a 32-bit transfer size.  The
>> chan_ctxt probably won't be larger than 4GB, so the size is rather
>> irrelevant.  Can be allocated anywhere.  Lets say that it gets put in the
>> lower 32-bit address space - 0x0_XXXXXXXX
>>
>> Then a little bit later we allocate er_ctxt with a different
>> dma_alloc_coherent() instance.  Being a unique allocation, it is not tied to
>> the chan_ctxt and can exist anywhere.  Lets assume that it gets put
>> somewhere in the non-lower 32-bits - 0x1000_XXXXXXXX
>>
>> Now we have a problem because we cannot describe a single range covering
>> both of these allocations via MHICTRLBASE/MHICTRLLIMIT where the upper
>> 32-bits of both registers is the same.
>>
> 
> Yes, I get it. I do not have issues in allocating all the structures in one go.
> But the problem is with MHICTRL_BASE/LIMIT. More below.
> 
>>>> Allocate a single giant DMA buffer for MHI control configurations and
>>>> limit the configuration address space to that buffer.
>>>>
>>>
>>> I don't think this could work for all devices. For instance, some ath11k devices
>>> use a fixed reserved region in host address space for MHICTRL/BASE.
>>
>> Why would we be unable to allocate all of the control structures in a single
>> allocation out of that reserved region?  Is it larger than 4GB in size?
>>
> 
> I was confused by the fact that ath11k driver adds an offset of 0x1000000 to the
> reserved region for the iova_start:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath11k/mhi.c?h=v6.15-rc3#n331
> 
> So this means the firmware will only map the memory from reserved + 0x1000000
> for MHI data structures. But even with current implementation, the MHI stack
> doesn't know anything about the offset, because it just relies on
> dma_alloc_coherent() API which will only honor the reserved region pointed by
> 'memory' property in the node (without the offset).
> 
> So I'm not sure how the firmware makes sure that the data structures lives
> within the offset region. This is more of a question to ath11k folks.
> 
> But your series is not going to make it any worse. Sorry about the confusion.

No problem.  I appreciate the sanity check.

-Jeff

