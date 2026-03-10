Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09470FD2D79
	for <ath11k@archiver.kernel.org>; Tue, 10 Mar 2026 13:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orEohHfy7GJzc6faGQD96uNhCW1mOo5TuHLKgf3TG6c=; b=3eE1lX6NcaOkXaC1a956NGjNPe
	qJC3++iq64aE5wvQjNzhQb2GcARtYTsGDt4n6I+x1LJs+xIShJ9dV1cOPR4nr4QN/gJ4BCdweDBNy
	foZyyB8cTcdjOi4+YdLoxnTpcM6RQZmM6bSk4HQ5+ZNU0lcN8ibmLoQXPV/32gqJp1luhxFl/xcY0
	fP+K3fbIbQM1aPhrkLzge9B7pk6zRIS/EJcfLFnHVzT5o03PdXJy3TzuGalpNZLoMdXErSH5GAt0N
	Li3kIzLa2KQjlXCs4QDqtJnR8Oqy3kIcD0gU/Goabho2m88dPE7ieZB4XJBfUFgelAMAVrEYs8P+j
	OuRz2I8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzx3u-00000009aVt-0uTt;
	Tue, 10 Mar 2026 13:23:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzx3s-00000009aVB-3U6b
	for ath11k@lists.infradead.org;
	Tue, 10 Mar 2026 13:23:49 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaegl304472
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 13:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	orEohHfy7GJzc6faGQD96uNhCW1mOo5TuHLKgf3TG6c=; b=pVrXf5o/EVBmE+wg
	BT73Rsn6SpKJ5wq+G76Ylf7BWahcXxLYD+eUmWPFXcaWhkwUpobx5lK3xRmxITXS
	bC+3ReO12w5lG0ypF9by+SDzV7dKvczmi4V1ObY+HulYNow/9x+coIgQOc0FDR5z
	tqh/NwxX4y8wUkQqnAe2Ol0tx6qnoYrTNmZo3PQbWnPYlAZ96o/M5CShmfzCT3Q4
	AKPsiGpksVlygVdcqY4yPVfjY54SOoGDSeJUIxOABYkWnjdZlzq8wUrR88zzeQ8x
	0ey8qW+7bpHy0Tuk5wPV+wlDXL8O9vInB7v/+JNZUUTfdiow3BeHh16CYZpK3pDP
	/hjuyw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf0mx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 13:23:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd773dd409so372283885a.1
        for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 06:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773149027; x=1773753827; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=orEohHfy7GJzc6faGQD96uNhCW1mOo5TuHLKgf3TG6c=;
        b=I4zF7yidUdErljOPP/xiHB9HydAm35xOV6Ilujf85oED9vXOoBQ8PR3eEMprreQ4we
         ixNhISlgI6+swzqpEeURn77zypvNli+lTX4pTyqvWqfQM8wQZtgfR4O45LB+I+BEYFSD
         I92M/wDwG0OTsCDrZ4mrqzFanftW0IOf5d5xwYGHd+KxSLedQj+doZ7MS/uGNvPdDEcr
         gePYra+okuI/6VhlcXWSBK2Sq1YZdbZVChneImwSLVG5r+75ofb9LQaY+XRESLki5jyr
         uCxAFkyR6BeFIz33NTeCBdBykZ2T+EfWEPY1tzi07nbdq3xsDULYS2rSp0nw64OzJ/w8
         9OjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149027; x=1773753827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orEohHfy7GJzc6faGQD96uNhCW1mOo5TuHLKgf3TG6c=;
        b=htUrzNaxe6cszeUzOc2deHJszR1e9f+yRK2DcChcoob4UBWY+wH6MzSvFnqimIEuqy
         IAsu/c4jCqps2nIB5bDzZTJW4tVSRw+YtjKADsYEOaQOfYa6Xx3bfRju6ariXfMCI9Lk
         E7P1pzSfvQfgQ5Q9iPnOpnrejH1cd7DV+BG69oSFCroxnGNBASkNF/zmxkubPQhJnDI9
         bbo1NDdFRSwq53rW6sCGNl00MiT6nsOS4LyGEcQ7fVjHwW1zGKWr3SuoO4+RDka9wTRt
         kKR0d/dSp9muEIpPnx6lsqV8/b0sLljt5/ESqVc4C84Es6lMoJu5Nb3n5oPhihdbKx73
         qRLg==
X-Forwarded-Encrypted: i=1; AJvYcCUcUzxHN9qnPCfh041SAobM2ROwkl3CfJNWv9x0nCQiF8JXRvY3DBZ6jqs/6xnWmDivYPyS73M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPCVTZgT7Z9teJCkwBp9YIymU7bkocw15GP9fe0wBF1yI+fUWJ
	mCzTtXJT5ZpryLZndA1QZTk+RcZfFXh3GEbP602qYgxrnBwR2rGdaNIGTPdRsyZ2jrVNXp8WDYw
	IGJ59N8xwMDhCdwg5Mob3JjoNNE6TbIlDvQF1bplLc19T6OpPTMCFwq81wS1/CX4Y
X-Gm-Gg: ATEYQzwSPvXh5Ga69IhQC9OjycOxlxejE/HNg3+bVi3STebO/DAA9lziIO7BnYmcVjO
	hmq6O0iKA/lD4m3vS29jG4LvML0xo9X9rh4WQzpYeHPU/t/l2aryS4/J2N4/YEFYfAauzRk368b
	Of+p64xDwicL3yBzbRXlWsfGBW2nJ9lG8Cteryl/Qs2R49QPQh1/eWROV+BkMLWdfZiPEJQvMQh
	iv/KvAtvNkKI5Q4eBDGGGLKWSo+0UTaktIUUxCkJndgFR0LI3QsKC8lI1T2HuNyfMoL3mgE1ZIC
	BDsKKIJCthzVGtgBX/Dpo7ewcbTkCM9s6nXW8S4adfe2cRwlIRT3SCGEyXj9cU50gZQYda+klhf
	u2G45fEuM4gTbfCVUW6Jy7sKGDdy8+jko6nos7YxU61QDwylqARh/Zn+sU5OhH16MXbxd0FJ1b6
	AO8P7+d+25
X-Received: by 2002:a05:620a:4507:b0:8cd:9938:9809 with SMTP id af79cd13be357-8cd99389e77mr147056585a.26.1773149025742;
        Tue, 10 Mar 2026 06:23:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4507:b0:8cd:9938:9809 with SMTP id af79cd13be357-8cd99389e77mr147048985a.26.1773149025121;
        Tue, 10 Mar 2026 06:23:45 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8da01sm37186097f8f.1.2026.03.10.06.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:23:44 -0700 (PDT)
Message-ID: <8ad5ecc5-ddd9-4d79-acca-41b3797f0f3c@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:23:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
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
        linux-sound@vger.kernel.org
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
 <7d036c96-e257-460c-a91b-deee0b9c348b@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <7d036c96-e257-460c-a91b-deee0b9c348b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iRVK4ML8587lC96uz3K3WhqEn10xIe_4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNyBTYWx0ZWRfX66vt14gyLu6h
 f4OIp5wHGc4BGKy7ceG0KEU3s/LlbJte+uGologTPi/Hb1FoxVAdUbUBgpUwJ1NyYvhGpB2QQix
 F4NQ1uEmLaAnS+z98d4QhdbCWRLCg0n/ubV5CULeuAYCmcWRY39SLzKvF8y9lha4gCj74STPlic
 Lw7gsr/KgXQbLxgjuGLRe/OFnxRtvyF9nBOA3YLhMMFggiJfXHCr5tKp/n2avX3xdlrCncTeaxW
 eUWXefcs9Z2xH7B5No6zQnuKnzlXd5h4OpPvbNU4zj+ZmvGixPaWV1eubTn6UmaTac7p0ixgAcZ
 68CsHdAEOc9wqVWwgGsi5ZFrAI4pMDbnJp3vLIjYQwkK1uxmUSBFJgrkGzPVhIXqHDZZmO48I31
 lBtAyi2Ifn98xd2ghZxZXJEUAITihlQk21Doqj+oQ3hkQIZicq1zgLDC5nWMZlc0KmuWCukaRf8
 TRSG/lM+dmF2y8O7hWA==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69b01b64 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=M45qCTXPNjoLw3xkhRYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: iRVK4ML8587lC96uz3K3WhqEn10xIe_4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_062348_909577_FA13D416 
X-CRM114-Status: GOOD (  18.08  )
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

On 3/10/26 10:57, Konrad Dybcio wrote:
> On 3/10/26 12:03 AM, Daniel Lezcano wrote:
>> The QMI framework proposes a set of services which are defined by an
>> integer identifier. The different QMI client lookup for the services
>> via this identifier. Moreover, the function qmi_add_lookup() and
>> qmi_add_server() must match the service ID but the code in different
>> places set the same value but with a different macro name. These
>> macros are spreaded across the different subsystems implementing the
>> protocols associated with a service. It would make more sense to
>> define them in the QMI header for the sake of consistency and clarity.
>>
>> This change use an unified naming for the services and enumerate the
>> ones implemented in the Linux kernel. More services can come later and
>> put the service ID in this same header.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>>   include/linux/soc/qcom/qmi.h | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
>> index 291cdc7ef49c..b8d07f2c07e7 100644
>> --- a/include/linux/soc/qcom/qmi.h
>> +++ b/include/linux/soc/qcom/qmi.h
>> @@ -92,6 +92,18 @@ struct qmi_elem_info {
>>   #define QMI_ERR_INCOMPATIBLE_STATE_V01		90
>>   #define QMI_ERR_NOT_SUPPORTED_V01		94
>>   
>> +/*
>> + * Enumerate the IDs of the QMI services

I've the same number of patches fixing the copyright for each patch 
touched in this series. Shall I post the series separately and fold them 
with the corresponding patch ? (IMO the former is cleaner)

