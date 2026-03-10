Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0626F3C27D
	for <ath11k@archiver.kernel.org>; Tue, 10 Mar 2026 10:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zym8eQRUnoxy0/BAjJ8cuqc0CkUIHWRkqrzGNeSb23c=; b=mzK+Zw3qe7lo3+UfKO22Gox4tM
	0de+LZhlz43zdIWmoD8TJMRM0rIZCUAgCvI0x7ggtw3JAFqgu6S1lUiW4ePloifxjBkPunzOh8qAw
	VLqlGRVntVfL/7ntWBz7ikD78GMeZ9BTNzKfzKHcZ2hNMMtBwg5yN5O8UcP7m0sXSEmxojeUBUG2r
	7vTSLJRNnR6ninjv+MNbBSljGIiyGEQuuJZzm11kQUkv1wF4YUeXOsJ6Q7cnXYa659uPxClMyLEkG
	DzQMRp3T6XFrsqJ7z806ndy2iZhAPqr3NwZOkPPzY6926/Vf2B5UapdxSNqp0SO0+ZcTI0Z9kmlKJ
	BO9UivVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztyt-000000099qC-3efh;
	Tue, 10 Mar 2026 10:06:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztyr-000000099p5-1var
	for ath11k@lists.infradead.org;
	Tue, 10 Mar 2026 10:06:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A5lLn3568791
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 10:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zym8eQRUnoxy0/BAjJ8cuqc0CkUIHWRkqrzGNeSb23c=; b=hxFLJaPzisZZN+jE
	+7Pri14DDd7KUEvIaQZDPIXFcX+wCQndBf/2rnxMD3KjDF2LSRo56TcYutc88uU/
	vRgGWaD4jQRkDk3jG+MV1j1IkaYJZp3VdS8bRHr7bSXu6B3yME9iAtPKWgcFTrPC
	YHCjdpoIoEpVEDbNd+XQ8QpXs/d7MJcLwMQKH7hJabjPmitf2vkM5quy3YlwPx3f
	NEHENaRFEFR8Aom5OuVVbSZ82XJUu8R6EcvuTeoRmkjdHj9Cw1u9kfyqyX2cNsLY
	Hvj+bMa4eU1F7DnjQrK5jiyHp48hiSndNP4UqB7+sVMSKIZnTDilIS0OpDBWzNPf
	Th8iDA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8gwny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 10:06:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7f6ac239so1540178785a.2
        for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 03:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137184; x=1773741984; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zym8eQRUnoxy0/BAjJ8cuqc0CkUIHWRkqrzGNeSb23c=;
        b=Wf3VY71ndpI5WXsjPWsM+QLMNViNA6h4zmjbgM10R5GSYfTBCNWw0dAKLELc7jnx2l
         mEaIzPgCgRiRSBO7UUlX4xT0dU9gaxOVEwINr4ZeNi4BxTuhKcmjOmDisD8jkeqGt7QS
         HwWayjOIqF2p/IbtLMPnJr2e8+9m7JE38AKLXknZ9+xgbhU53D3HZVghhHdK3X6r4X8Y
         Vl26wJatv2fdPyAU7+LpM9SuPz24i4ktkZvK7L7S7v3GBJWUlzhjjVj1rfGhYk0e/9Hq
         EKI+dRVTGEeCNBta3BfppcqE3XGojf1Z88Jr2vdmBrChlyh08OKN7pt4/RiGmVS7FpIH
         ozZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137184; x=1773741984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zym8eQRUnoxy0/BAjJ8cuqc0CkUIHWRkqrzGNeSb23c=;
        b=ACOiqpmHtyTrHLXU+jx5UWaQyYsu4+ZXkUGvlnU05f9Mj2ysxs+sTUJtBcEZecnwck
         Mzbgn1b38m/LYWTw1jINyZDHKV3gSj2Hy+hzaJRS7cbbBA46+lKNOpNBeM17e2rkEUID
         1wvirUnmsAQmZYnyfbT0iSjQYllnUvpR6Np3KRhKpvSFVOc4GSssuqUZh1Gpr2VDoEqx
         H2dlRv4eY9q/qqTT8PiCufceVl23bMclnHHKXTmXuH7WqcaiEzZAbNlsJGlxdl5bpxMA
         sqxdqvHPm+eEvFTblGrvIrJm8QWV1wVLv1apMH9u1nwyZzW5/P7G3AQNZ0t7hCh++phc
         AfzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQJqSma1U0F4T3oBfUWH7i2ys/hNzC/doLumwqiLPARqG85HOVSxiUyzBnX2z5rlAB6N7XnGQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzvuTxfEYt1/eZoDNjZLgfaQmwyYjDb0/jL37duRPprDoLdqGeg
	MzObHt+k0NJUKMdVPEGmKkPoxdso2jWPzRmrZHEH9noqg2udEPX+ZIEYVDqvbLOJE61orqgwrZQ
	0beqWCmeuv+NGjmrj1376JuKWqeqFGVjZGLottzOyP0RAp3pOIPenReyQTfXzN02w
X-Gm-Gg: ATEYQzyFyGbhNQHUq+cT2rFDP2ZZ4nxISth+uNCVJUkLA050LjZd8dpeIarItPBroU0
	3Xpkm2DWk42yollEOMJpjHxcL/44s8b0GqzI2w4/gxEPNdR6X2QH9kF9WI5KYdB1k+LIssRH1CB
	sO7En3M0SBUEOCeHvNl16xEN53dwMLLAcLGVkBTV2ubuCH+8hvz22DN93U82Y6zeEHfY/8adksp
	oUMrhR5IstYmFkAUjSHMG9kfM5+3NI5Nz/8mDr+3B2fHTh0ZGtMNcKPK3+Y7iyc4kw/7Bbn5Cjv
	fGL3V9z8hLdHG9xHkzOogKwFiR6wu7l3DjkuIKAtSbS8eRFxilo/6Dr2xWUPxsxZ3KNFL4Mv80w
	AM7Qy/oE0S5rKsHTfARGBAOWInpYLp84zd6T2DQDB6QmKmasAF3fotbdex4iaRdn54K2bWRGc8P
	zyn1TsP76K
X-Received: by 2002:a05:620a:3943:b0:8b2:dabe:de32 with SMTP id af79cd13be357-8cd6d429895mr1705195485a.42.1773137183856;
        Tue, 10 Mar 2026 03:06:23 -0700 (PDT)
X-Received: by 2002:a05:620a:3943:b0:8b2:dabe:de32 with SMTP id af79cd13be357-8cd6d429895mr1705192185a.42.1773137183406;
        Tue, 10 Mar 2026 03:06:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d973sm32447848f8f.3.2026.03.10.03.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:06:22 -0700 (PDT)
Message-ID: <58f49fb8-75ee-4dea-b7c5-28e89711f9f6@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 11:06:21 +0100
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NiBTYWx0ZWRfX6A/KIvxL7Nj0
 sTn2N9kHGiMT6lo1qGpnC1Uh9vDaXcikc0E5GHY/HwnQQMN2484gXyy+V6agOPW8ycyRzVSbm2/
 PyRICkxuki37SA09AKAA+//IILV52rbmnNrd3Ktv2FCgO2kizAVrKean1bZ+XZcQAp4jXogpRTu
 oipeBTf1FpuZHVuoxX9tj8jploTL01B+g+E9fmwMD/1+Z3MPVmxotB60B58GWSI7yhLYsQzpv3j
 QUs5bsHaJ9R9MLVc4nsJPE5Ku335XNytP2ovlaHR9LrdI3QQY7TBLQ0tPi73MbfPF5GZ7BaiSaQ
 adC9fmDLvMLiEObgFdQgXyb4jJ2cmS3gIH87QBrgadzQYC+Zl7PgskSgi0bZZ3gQANmn11LuYVS
 bTCNGSEv//GihEJ8+dpvpPapndbQ9QADFgJr3gQPzNFMOkULOo6hzeSKGFfrSzgxZ5gmiyIOQqx
 E2Wr2tYvZ1EgqsPtfEA==
X-Proofpoint-ORIG-GUID: gImuFPLnBPBKoBIer3gxOIjimHwtHGfF
X-Proofpoint-GUID: gImuFPLnBPBKoBIer3gxOIjimHwtHGfF
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69afed20 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=7MBKnE05AAAA:20
 a=EUspDBNiAAAA:8 a=M45qCTXPNjoLw3xkhRYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_030625_621559_3B64D7BA 
X-CRM114-Status: GOOD (  17.22  )
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
> 
> In case that's useful:
> 
> https://github.com/linux-msm/qrtr/blob/master/src/lookup.c#L23

Thanks !

