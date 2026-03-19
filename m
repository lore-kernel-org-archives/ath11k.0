Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A288107527F
	for <ath11k@archiver.kernel.org>; Thu, 19 Mar 2026 09:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EH8bY7QD2EKZljMmJ8B7Le3WdFz6YOjIGZw8lo4HuVg=; b=dUGpLW6R/xFkfXBxsav7CkdR68
	7HlFMyc7oueqpql3sxyGQb/m03/fJSKenlq05TtYnn/jTQ3Thurby7tcOnH0+oIpFKqW6GY9pQi1Q
	ewidO/4i5LB4na7N2TwnoZAP4wAQ7vJuSfItYZL2hFUidcHYy9+d4cbgGGfaI8tJm6pod5ajw/hka
	tIRW6I0vgbTzmNTi5xvRRZceg7Rj9tVCciKPaBjfdyfgJcfIk0dRg9MuCHlLGE+e5qkFSLCrPlVfo
	wRjIobIuj5Zo6R1uvUlDfzDQAON47en8h5/0CPWTfetikQ4pnwn644HFCsKk05Kbg952Dk+ZK8k3C
	cLOpE2MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39J9-0000000AI4J-02mW;
	Thu, 19 Mar 2026 09:04:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39J7-0000000AI3R-3ucA
	for ath11k@bombadil.infradead.org;
	Thu, 19 Mar 2026 09:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EH8bY7QD2EKZljMmJ8B7Le3WdFz6YOjIGZw8lo4HuVg=; b=NpdAMDHQg8tVTG/DD0EGHr5X4d
	VQB0uUoEkug8RYwV5hl/1mB6gMZzSWxU6g5HP4+Tddy8EnFlmxR0nAx+20umdnufiPg+NSnRYEdMp
	mRoT/IxLVgAZjmUFpn28ThVr7BqkgE+PJrOrQZp0O6IC+QgmAgbwFnheGy7grrVpNsZlFZys8YZbH
	BkrTcBObEH+Ph8EKnzz+x1wUVAM56RI5trSGPY3CSFesFzUpe3XWPJ+tybS32h4Tmla1UfAMRZnnW
	pczGCUje8txHsGckN4iaVsdAZyL4EREa+0KuIspKJztKdCnf5ckpE0XNI1An5+WoiHRJnMCcHF9Ie
	D96tWFuw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39J2-0000000D5Ol-2d4y
	for ath11k@lists.infradead.org;
	Thu, 19 Mar 2026 09:04:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73va53368471
	for <ath11k@lists.infradead.org>; Thu, 19 Mar 2026 09:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EH8bY7QD2EKZljMmJ8B7Le3WdFz6YOjIGZw8lo4HuVg=; b=ZKtPPF3TzQXeJCxI
	vQqPEYIW+n4THnio++yCy0Zpdu+66LcC7xdB/QnqocbGxLW7k1ce5fLn+zlp9lQ9
	XIhHU7h0OaJxOZdVDzIcCu9Klei6V0g98WlT+kjPUMYfRdBiEYuWVQCN8ld9hxFf
	Vy1pDB90rA3E+B5NKbYhKlwZ8cQaFZLVw2IsMt5wyZZ36Ny3+jKkz87EUA0B19/Y
	8X6NCs0/cQQyjFud5HJpuEljDBiXbzhQuNNs02jHMtl/P52Z2lxVfvHYk7WfYxcB
	BHotcCZc82HL7QVJai6mwxvmpXknZzIe52riBBcmYd/5VxGUTg6QfP3809c3j/5W
	+0tLSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9jgxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 19 Mar 2026 09:04:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb706313beso125824785a.3
        for <ath11k@lists.infradead.org>; Thu, 19 Mar 2026 02:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773911078; x=1774515878; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EH8bY7QD2EKZljMmJ8B7Le3WdFz6YOjIGZw8lo4HuVg=;
        b=exrlO7A+nCxZX96olxxbzjFzwT9a3YAbOPQS372uqVvbmalUCJ42CkgoCIcnoUsqxx
         9x2KHt8Xw1nDZ/w0gOn309AfCgJf4ItIzzqwK9jxgo4dTfsAPO4EdiNjOBPFuwqktKZR
         VtmK851yuFVyhiLqKKe6m04DhfjVrO/qknfpJ5Ewlo62/ocE0nkzSTKfvlmNdYLDsxlL
         ov2M8tNUWBPdUEi6JpYzjy7oBh+7ztN1dWlpgx2WkVjejZtL+HGVI9IxuR+r3sdji/LC
         6HcQV0dxHaL6KDXGl6qWuI/Xshc8NChdkUZ4gDiHo7GfsiJnUqtElOoPFXBX5aEyt+s7
         qIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911078; x=1774515878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EH8bY7QD2EKZljMmJ8B7Le3WdFz6YOjIGZw8lo4HuVg=;
        b=JynxI44edFbmaQ34BGn+jlAdfO0SWetWHmGtBuO2pz3gU+h15sEbNCHJ2HtNN6v+F9
         GsfE0It/7MDQ8RXF7ggpewsXG+L9AqDq0Ik93OiywrUSxVIQJxgvpUaVdPDHewdZE5Co
         kIovLn8Eg4m0I5INrdge8YiCZTvqmNzusqHmtR6TDy7RVDMaxvQVDxT1I4SyvvnFOwQY
         31P8aAMJ0nfU9ftrczKPJ0z0WPqciaYbDFZoPKf7mJbUH9MpoSiJJ184uK0V0SH2CbwO
         r0iQ/GP3fRkeps5oblqGhjAY2sMLG+R65Yv47ywhADyTO2W3U46EkrDEfPaDN+e5OBWp
         RjvA==
X-Forwarded-Encrypted: i=1; AJvYcCW1+yOXBvI+4b5CvzIti5XBNgQDDFMG4XYCvmZsQTzmIesuE5gVFh183bHEH+iS1sYjx5TMyQA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbz1jdBcFMvQuKJZPi/55m6nmOkHaXSYBvbB7Dhvjv19BBmAHN
	BnoIrDiMWrpKeZbbhx/o5hPucEnEbcQr2B51keKe+IzRG089E3ZozfSyjHF36DNyr6NPynhZwxW
	6Pr52kojAhV3gdEA2yH68GqeRFIh9G+mb05Og2gHYX54zfqHvcRvS5oDboCYLlikg
X-Gm-Gg: ATEYQzyvUKDOV/BTvYLtPB0PlSueXltNSWgy4eDd6zRfvZv2EMif3EAvB7cscxzPSlw
	unb7ooNQPCcQt3A05DEcoBMv+WwGE5op0qn82qmRJo6X6DvzrLX1KUtYyNm5BJjWp/e+SuRIpCN
	LqQb+iMF4nL4nd919+F9hYI0rZwjp2sFGUV9Jls37Lp8z9J+O6yVSqU64BHIp2EvSjvaslZB+AT
	yZ7D+uhss4Pt7zy9qxTtB/71Ox392Wky8TBdUWKO+POyRLYI2k+edLu05zmPnIqTBH5Zdy2H8AM
	7YL9miB7qNMQVvgoa5j5GWJofnaBktVr+zgI/JWw0UF5kk4CDOv/kPmLgQeN6xJyDPS95ZAwh1m
	yI1DC7xdzZOTVHbwwzC2VAeRwuykF10anphqp8mg8WK/Nh+cBFSblF+sNeiJRl+I/nmQpZRYrrM
	7jAhxpO4Hv
X-Received: by 2002:a05:622a:30c:b0:509:2ef7:703d with SMTP id d75a77b69052e-50b148b8cefmr85605651cf.63.1773911077924;
        Thu, 19 Mar 2026 02:04:37 -0700 (PDT)
X-Received: by 2002:a05:622a:30c:b0:509:2ef7:703d with SMTP id d75a77b69052e-50b148b8cefmr85605091cf.63.1773911077402;
        Thu, 19 Mar 2026 02:04:37 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba847fsm49542665e9.25.2026.03.19.02.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:04:36 -0700 (PDT)
Message-ID: <74a9bd51-8c35-4996-88ce-8c1995b506e2@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 10:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ALSA: usb-audio: qcom: Use the unified QMI service
 ID instead of defining it locally
To: andersson@kernel.org, konradybcio@kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-5-daniel.lezcano@oss.qualcomm.com>
 <875x6ug6yf.wl-tiwai@suse.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <875x6ug6yf.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MSBTYWx0ZWRfX5DtbgHqe5daW
 sn/8unyCE66wKhkM6Xp108LhvHmmu2CgITinE6Edj2qoGG/4ffJTN3VxMBz0qXLyPNvifpLAKzA
 1R++OYNZ6C8ZnrY5E2zWIIDUB+xISWHidGHFfB31IYcizdfR9sp57vIsedVGdLz55Ov1a9wffDm
 0m/qv1p9hM/Wl7ffzWdcGmU3s88Fy9dPnEib91so4OeVGaW4A8Y311OCaORrXoGwv40sEJBcZc5
 lPjUff20wBre+RUzAP/drwEY9cS9/t3wMLnY95kxTBjLNZIKcg9jX6/Kb97wCKurCQEZjUcDjXJ
 o5Ev0uHUwTWx+RMl+NZcFm8R/EZcKV5eZd+0lkpibSHwWFoUHzK+CE7JUgmvrw49PSB9oLsM5tK
 C6KGSiUhDUVYcGOOBVyc2GvBQAg+ydD4DlT4tSXyFbtq6IAFeyBPeVFe5q2beClupqMbSw7Ajo6
 2MA0T7e8v2H0Gsy+HHQ==
X-Proofpoint-GUID: cPRfezxBjqh8ir6jL2KDUagO4L8fXPIT
X-Proofpoint-ORIG-GUID: cPRfezxBjqh8ir6jL2KDUagO4L8fXPIT
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bbbc26 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=9ubS0I03ALhbG_YfUWEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_090441_025100_9E98208E 
X-CRM114-Status: GOOD (  13.60  )
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


Hi Bjorn,

On 3/17/26 10:07, Takashi Iwai wrote:
> On Mon, 16 Mar 2026 18:14:14 +0100,
> Daniel Lezcano wrote:
>>
>> Instead of defining a local macro with a custom name for the QMI
>> service identifier, use the one provided in qmi.h and remove the
>> locally defined macro.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> For the sound bits,
> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>

This one can be picked up for qcom/for-next

Thanks

   -- Daniel

