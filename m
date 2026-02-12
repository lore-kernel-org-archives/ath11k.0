Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F277EE3698
	for <ath11k@archiver.kernel.org>; Thu, 12 Feb 2026 15:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0Cmlk/Minp4VG2OAandk7L3RRoq662YgBpDU9gk8pM=; b=FoeX/vj2u1yLe+pKRgyCoxZuuj
	EWlhpcyici+wZCOlIx2XROJb/pvq6krP9ykyg8F1G0OKHEnooD6R/0xS4GqKlBZ+brpmxwvoPrQ4k
	g2EcWeYHTt9xV5sAocD3G1i0yB7S8RCzAKVJsP+etOxOoGXgyz/FtRJWS8p/lAeLsHmVkT4QvEy7U
	W8MpSa63A44HyPVDSQx7yM2dla5uLqyivUHWryH5w2rsKFDa9Z8d8P37do45Y1LMsHF9HPj0Rdpbc
	ovkUhI8vr2SbYq6NbX0WIHkeG3WcXjvu4ZILMriO3NBkbtH9nDULlvazs3YmghuU4qkCpLwZOTwl9
	Pe8OQuLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYYx-00000002GDJ-3cPZ;
	Thu, 12 Feb 2026 15:25:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYYu-00000002GCS-4BfC
	for ath11k@lists.infradead.org;
	Thu, 12 Feb 2026 15:25:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CEFuo82121317
	for <ath11k@lists.infradead.org>; Thu, 12 Feb 2026 15:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0Cmlk/Minp4VG2OAandk7L3RRoq662YgBpDU9gk8pM=; b=VXqkHmverqq1ueY2
	qtjatH82a4s1glaip30Gr85WGgCkBp68ot99Db7oXt59YBqguBLA+nLXHjtzwBpc
	6DPw47fcXX3twuO8cdMJ0EnBp22OokhZm5dzMgWwt1aZnoyq+6KzYXw6WEnvW39k
	IcTuKzwQMHpBQUI8cX27KR3g8y17DA4I5G/ViQQjzuHdOIYMETqHQFzl43sIws6w
	eAZBSAsj1YUZNYjtLPnQyNxiJJ5ZOilieGO8MUjcHy79iKoFC6Y2bnpF00Ui8PAD
	uBhTwm6nSJQUXC4hbtim1juk/ZI3PmUV1DrzzDOLyVBJbTJVL22RitPGGkeZoIM3
	/ERUWg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9gfm08va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 12 Feb 2026 15:25:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-894a207e7cdso27343316d6.1
        for <ath11k@lists.infradead.org>; Thu, 12 Feb 2026 07:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770909899; x=1771514699; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M0Cmlk/Minp4VG2OAandk7L3RRoq662YgBpDU9gk8pM=;
        b=Codl9gtBjEg4veyHc3uUrgM3bWUubzAUP80bOzUYaEHElh6SmoPKct0eP4hRffnSm5
         QFyDASK2Gl4kse/JtPJH+yMbOqTeF5cOMn4cjyY1vrpiR/LKnGjCLea5DOmFNnvmLZSq
         Ah+NTSwbIbKgTWTbqGs8VhA1DIY3XS0F1+JPQznj82KeSQeJxm2NJPWP3rffpZAaiXgK
         xtaWBeFJ990c7QmGUPe3lLHGKEteysZE3xumMG1+BwLiiPUOG91x5TvE0sM8nHtmipoV
         aztH9YrQwoK2f4wWOWAlggAW9oebq9SQsbo9ksFMIl8ypivqYf/knRi59WLdaRSQ+BLM
         qrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770909899; x=1771514699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0Cmlk/Minp4VG2OAandk7L3RRoq662YgBpDU9gk8pM=;
        b=WaLg1EHk8zEzd2X5dEYW9lYrdWcOBY7RensSMZ9Nib16WFua34wF1J2dCf2TFA0RAb
         ZBKLyunzrFSShNyNbhBzItBV3uLxvn868KFfHRJvWKoWwoyd7cS+HutbMZ5U2UbxF5sp
         u3r2KpqyLtML3P6XDW0ic+6EQg99VYJFjiEISosO8ie+ALF5d1JP9pbxqRhuFBSbgTEa
         6Ou9ZKj23nxTQ0l2JM1yxUyK8AkKLIlmc1uQM3K0rpJb3/0jD+Li/MUzzZ+hNUBu9CLj
         bqkSH9JjV8S0mKPtL5HUxr5hG0N5B2cbVu7b0+xOcwNk1kBefql6NAu/XVheC29xuiFf
         nQkg==
X-Forwarded-Encrypted: i=1; AJvYcCVoc52n35KGPc7iZFalb32KG6r70MCaqKF9Z+PsFCKazFQUwZUguhxG5IWTDTbWIK6Iz6rGgBc=@lists.infradead.org
X-Gm-Message-State: AOJu0YweRfY5pIeP3BM8oHbkD98q64zSXr6GjqQkojk7DtyXNI8oXBXc
	Au3zV4EBX9y5ZWoCxZrZ9bJYI9jQU2URr8Mgl3eXhXik1QiJvwc5IxQGS4+GrHnnsxlYnOGWl6D
	IZ15tzMrqPg3YT6Q4lyidzIUL4f7hS6wcOIqk5s6NXxfLswQoljqF8F3BIbj5hHuS
X-Gm-Gg: AZuq6aIBanlIHVN4RyIQ4CgZwDBYiSRlCTqfyXitKt47bo1/35UPYg8WGq4IAPuSYg/
	DFxzFYTlukiWzXXMBdnuFRhdehemgOpNhPmPzjo/GtFqTOTbBPe7S9C3cm1RFToWR449UB2wQdX
	+YCkdVBwKDM+izFejxIUhd6pqq3gM9C1pW/r/86RuB3klMiMGeEhVLOWvWE4QmcuBleyjI3ml3o
	AxZKHV/K53QzJMvvNoSyY97i9+OQ32tUalwc3hrSaZHY08HCXe7nlPDJ2NhMlws/SEyDvQsHbeV
	xNGGHBc7EmZJb4PEYlKspiXL0k9V0itDl7kaMV71a602zZWnuQmaH/BoTGugoo3iYX9KWHd2dsS
	dZkDfGiGyNDuFv2n2TlMOixtJvvQvXAoPF+lv/cruZ5G1nIB70Ze8YaesgjzMYDR9maj+q4bcst
	gGQ4w=
X-Received: by 2002:a0c:e002:0:b0:897:3f5:6a9a with SMTP id 6a1803df08f44-89727aaaaf6mr34928756d6.6.1770909898762;
        Thu, 12 Feb 2026 07:24:58 -0800 (PST)
X-Received: by 2002:a0c:e002:0:b0:897:3f5:6a9a with SMTP id 6a1803df08f44-89727aaaaf6mr34928366d6.6.1770909898191;
        Thu, 12 Feb 2026 07:24:58 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cf50e38sm1794656a12.33.2026.02.12.07.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 07:24:57 -0800 (PST)
Message-ID: <6e706170-4dac-48c8-881c-4f244a3db34b@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 16:24:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Silence remoteproc probe deferral prints
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260212-ath11k-silence-probe-deferr-v1-1-b8a49bb3c332@oss.qualcomm.com>
 <f028462c-ae31-4fa5-b414-e03d3a73fdf4@oss.qualcomm.com>
 <zpddlyuwrxr2rwjsyzsucgm3irtxmetyhhajptveojnmo7vcni@ntyqoahm6xtq>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <zpddlyuwrxr2rwjsyzsucgm3irtxmetyhhajptveojnmo7vcni@ntyqoahm6xtq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mMb2IM5WVoxoBcUAlZojoKxNP6D4Evrz
X-Proofpoint-GUID: mMb2IM5WVoxoBcUAlZojoKxNP6D4Evrz
X-Authority-Analysis: v=2.4 cv=Ctuys34D c=1 sm=1 tr=0 ts=698df0cc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=mOPo6HKdNPmMLqtFk4QA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExNyBTYWx0ZWRfXwuoQG+teSU0u
 2CvY6L2zIbb9kVmoSBiGtbGL4Koy4ma6qpX05voGlH3RTPQ9In8N5hqlvs4wOTqDfjoiQ9d1tmJ
 8lmnZgFyJ/ltQ92X/a773DpxHsjh8EapvLsStUgixAJZpWUkzXUkSd6SVUF8Kc+4jpdW8cMpTaS
 +Md8KzG2MWo6BZJkKjKHPdLggPIXwA4bmXVZ27F16thnJLkJRdd+fofsp3oK2ig9befvBiasRdW
 MuGX4tBWr5C7iSinkBoLht6gZBGsdgKlBEGAufEfUi20mlit2Mmkbc2e8ObltnjvMZQMOdYc0Dt
 mThEKezT016doJxo4d7MmwGE327VJQXViGo//TzW28pH/Pvysp79K6elkt4zw2ZHL2XiejbhwBx
 WM2WKB80k6IsQNP6Fp+Po1S3GMV/j/CpZQA27F4Nt/qbbihaAXAnMspowLtGcY0uF/eTl/HGKbb
 dEDd4GDq+6kcpPqhLHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_072501_061927_C3776EB1 
X-CRM114-Status: GOOD (  20.41  )
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

On 2/12/26 4:16 PM, Bjorn Andersson wrote:
> On Thu, Feb 12, 2026 at 04:01:21PM +0100, Konrad Dybcio wrote:
>> On 2/12/26 3:52 PM, Bjorn Andersson wrote:
>>> Upon failing to resolve the remoteproc phandle one ath11k_dbg() and one
>>> ath11k_err() is used to tell the user about the (presumably) temporary
>>> failure.
>>>
>>> Reduce the log spam by removing the duplicate print and switching to
>>> dev_err_probe(), in line with how ath12k handles this error.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>> ---
>>>  drivers/net/wireless/ath/ath11k/ahb.c | 10 +++-------
>>>  1 file changed, 3 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
>>> index 8dfe9b40c12626649639fc1dd9da0e5e0c2dcaf1..08d3a0c8f105b26b1548c5d6006f6ea162fe58ff 100644
>>> --- a/drivers/net/wireless/ath/ath11k/ahb.c
>>> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
>>> @@ -807,10 +807,8 @@ static int ath11k_core_get_rproc(struct ath11k_base *ab)
>>>  	}
>>>  
>>>  	prproc = rproc_get_by_phandle(rproc_phandle);
>>> -	if (!prproc) {
>>> -		ath11k_dbg(ab, ATH11K_DBG_AHB, "failed to get rproc, deferring\n");
>>> -		return -EPROBE_DEFER;
>>> -	}
>>> +	if (!prproc)
>>> +		return dev_err_probe(&ab->pdev->dev, -EPROBE_DEFER, "failed to get rproc\n");
>>
>> I'd like to think this doesn't really change the behavior, but I'd rather
>> see this that in-house print functions..
>>
> 
> I'm having problems parsing your sentence. Are you saying you rather see
> us keep using the ath11k_* functions?

s/that/than

i.e. "no"

> 
>>
>>>  	ab_ahb->tgt_rproc = prproc;
>>>  
>>>  	return 0;
>>> @@ -1190,10 +1188,8 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
>>>  	ath11k_ahb_init_qmi_ce_config(ab);
>>>  
>>>  	ret = ath11k_core_get_rproc(ab);
>>> -	if (ret) {
>>> -		ath11k_err(ab, "failed to get rproc: %d\n", ret);
>>> +	if (ret)
>>>  		goto err_ce_free;
>>> -	}
>>
>> If the rproc handle is unavailable at this point, we undo quite a bit of work
>> in .probe.. would it make sense to move this check way above?
>>
> 
> Given that devlink doesn't covers this, but presumably cover several of
> the above resources, I think that would make sense. It would be a
> separate patch regardless...

Yeah, I'm simply thinking out loud

For this one:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

