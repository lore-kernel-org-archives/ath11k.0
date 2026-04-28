Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7481FF886D
	for <ath11k@archiver.kernel.org>; Tue, 28 Apr 2026 16:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vS7MZwC/c/EdYfGyVktKa95cOMof7DSqpzppE9rq4aQ=; b=3TuRkwi3a/mHEyyztO8qZIuZif
	L4IzwlvXsVNnlgzfS72rao+3QYHjmfJRw0r/CKZyMTuPKb6mTAPnEXGzLXmKeV5P0dUHiNkt9U6KH
	cEILPnzVWJkW+opwvGNuELkUeie56KarsJnO3OmcPwkDIbkPYH/SRRPllWMqmY7S4Ig8bx77hwtkS
	hXIOCFB4NmR0JtEwswxcZ2fw1qIZl2+jFUGWz6fuY4yDedKw9gZZtMGeKMhNIx4Zjw76PM2sncKw7
	5eFKhXpxvidQ1vQCDQAE6ReBZLvmmMwFWWTSk16X3ObXcPdxW+4iCM24GKxDBnQbnNmXe2WQRFd8a
	nEdeVLdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlTc-00000001xZ4-02DG;
	Tue, 28 Apr 2026 16:40:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlTZ-00000001xY8-3Okx
	for ath11k@lists.infradead.org;
	Tue, 28 Apr 2026 16:39:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsOGt2843731
	for <ath11k@lists.infradead.org>; Tue, 28 Apr 2026 16:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vS7MZwC/c/EdYfGyVktKa95cOMof7DSqpzppE9rq4aQ=; b=f7SzQjo2A6gvPSWl
	4RSvhk1zwSXT5U1plZ2fJ5UTix3BYVLRUWvlmwud43vB0Z+JYf/OqNXL/5AbOrrG
	8mTZis37OGV2svwSeXhojxzhKhDvnGF3b0NiEXfvTbiVqOxmmpWe0YZeJUfcimO2
	n40R+UEiqXUZsBVkMiItGY+y6VBrQ/XMMw9sIwJ7f8R4Fx0xZhUcwQ9k0dURvFK0
	GOw8air9IRe8GaiBlW3fY3MeOVtlGFz5MVK/HPDRUIrGLlxSkYc/7l2YnYrMRUU2
	KF5YlhvY6ijYL26viLxaEbmRPQepuH9rTNJD1l7hW2aLWwIXa0ExsIIEXCCL58Lr
	gpo/pw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtryda5a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 28 Apr 2026 16:39:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2d93379001eso28039688eec.1
        for <ath11k@lists.infradead.org>; Tue, 28 Apr 2026 09:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777394396; x=1777999196; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vS7MZwC/c/EdYfGyVktKa95cOMof7DSqpzppE9rq4aQ=;
        b=jrFGGzICK+eaG8OHrSAFGGGqHfPKv2xFcF6OcHkwtFL7nv6GA8wh+sjPBeJOsdeToi
         RmNV7LhOk5yO9wSQGvUotfvPj4TKmaGpNERwuGT4QhT8QAJvEvL+fHDbFsLG7sOOkZHp
         4SyQDC4GdtCd69dsAtJAS64bapVcb7/XIlwFwLhQeyzQjTqYTFmh2hNlUqC76o+YpnGm
         yfRGjo17QsW+HX+knc0CQEIf8ihrlJMOhfH0QRV4JwBo11/b+vcsGpFZ2GsUug8+IZqx
         jAAEwED+H3kaE+G94gcU7ZbhGmRgv+58IQGSRirIrJBo5AcO57gNAXjf/2pdz1kAI2K0
         tZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777394396; x=1777999196;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vS7MZwC/c/EdYfGyVktKa95cOMof7DSqpzppE9rq4aQ=;
        b=NNBfu0aOBDynKsogGLzeVedc23mm1Qbo7Yjfqk8hGm+4iv2soSCA/pMk33Ov/Wh1Ho
         xuPaRBcBsYVzvtJYo3xWUkDWv/F9aySktIWgKqm9aUjsVHbF3xATj5MBBJkR8LoQhwNq
         7XDpnI6BfAKr6TSkawz2WDYdGpsz2uU3KkptnSHyMd4m6/kVKydxGRjvc7UPJB9tSU8f
         NlK5DOhgEC8cAcraiwxmqedus+608LeoXSiBuea+XpXFwKZ8XTJsR1KA1woaW4otK8kN
         mzPlCcic4ffmDapscCJodIQwEyZmNtfZX0djxdctzGU8flTHetDLzOKMhCBOGKwdOyx7
         QMog==
X-Forwarded-Encrypted: i=1; AFNElJ/tljrs9WvghSSto8v/bqBhcGY6AvYetjMujTnCQbo+LqzfczInog1b5XhA+ut0x18NbguGG0w=@lists.infradead.org
X-Gm-Message-State: AOJu0YweDnB3kOtT/hY0FjsXB2QZSpcV+EXja2RA08kkFIt4kXN2XxMr
	sXfQvRjdnq5HpqCAtN4hJ4PQdNiiPqucgucv9RIW4DEqUGjVfhJjgARdr3FpSkUVNbYrwE70rGw
	TYGDIz9CAhIIDzwzDb/R62O/ICXZHatN2BwR3OcRMg9/kRBMSbHPlpjtT8dCNuw14
X-Gm-Gg: AeBDieu1XAU6vovVUplSc1V3b2rkZlElkMB/xqJ96ssm0R4QOHW0HLaoCLByj/la5//
	qnffV5hEf0cUPIZlcK4TTuoYJDk2Cjsp7HFCKT241UfRJL4tfSuQ+T9WjXchl8TXLiC+L1va8AR
	a77V2ooXX7jiwZA4le9F/I1gSsk+tsrDQ+byNOJMD6WmaZ1BY1CHHf08UoCX8X02WqyYGQykVta
	2mqb3koj7zlfWOnDamKE86HQaz41UMln8xgHKrLZVqPhJjD8EaMHWVgdf/Bj5XYz3i+iVMf0B5B
	AF8nNppdr3CH1DNhWeOfjjqbWHfFC19Wo5ZXHQP+lTy2T6DkQmwQL/4WA89VEcDQsxoVy5bXU4a
	Y0nCLGVyWCzf0ngBBM5cLZ2BtS2YuMFRVA+IV7MT9sdUKsXiv3laR9gr0WIcgBKt04O5YkoD+YM
	QGI+aCNSfZmfUUrYR06H4bN80t
X-Received: by 2002:a05:693c:3006:b0:2ea:3370:6e51 with SMTP id 5a478bee46e88-2ed09fb0d22mr1787703eec.4.1777394395804;
        Tue, 28 Apr 2026 09:39:55 -0700 (PDT)
X-Received: by 2002:a05:693c:3006:b0:2ea:3370:6e51 with SMTP id 5a478bee46e88-2ed09fb0d22mr1787668eec.4.1777394395038;
        Tue, 28 Apr 2026 09:39:55 -0700 (PDT)
Received: from [192.168.1.47] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a0ce878sm2622054eec.16.2026.04.28.09.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:39:54 -0700 (PDT)
Message-ID: <e8c37614-354f-40d3-be3c-983f45e5bb3f@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:39:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] wifi: ath: Use the unified QMI service ID instead
 of defining it locally
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
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
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-3-daniel.lezcano@oss.qualcomm.com>
 <51e28a7f-8362-4bf1-9b9a-9af9cda1d748@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <51e28a7f-8362-4bf1-9b9a-9af9cda1d748@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gLkdtZ4PE3j1Do0iOXxvPCF5ktRMALC9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2MCBTYWx0ZWRfX5ZX+ImUobRLy
 zZ/F3DO1M9Hbabsga8RlJmvCszQODyqB33vao2DTk4ydfVOzhvtATQSbCnK4/ribs5tU4jaWwoO
 wsm6poOBNxqYa9dYc9TiD8LUreYpN96WRIDgJAoigNVrXFXAzmSkJ4YKIqz15kL2U6M1ktNIdu9
 Hyj7KxiSCG3VkzKr+hhgKLl3clc9AzyKAicax82BSIX4rpbbto8NupOlLnrGkzYEjGSZ4SyrGoY
 TbYKaJvB6i1BMQD2TDdYCz0uvmu0jHOZGu5+rr65O6PQuo/kNx1eyf3LBFNTr2qLLQ+WGibTb46
 d7HKsxz6cbzMEl0JT8MtgBYJC3EbahRSntkuaOi4XzEC23lypiJTznOWCTsnfS44Fl1HtlfTTu6
 Hhfvs3p8pck5aXm7ds/kpZ1bIK6NmN6kjF+I9JcuAPIj++WF9mejU8uSjFrLlcUWIdHPtZxgmiT
 w7exFPl2oBZ7mFv7t1g==
X-Proofpoint-ORIG-GUID: gLkdtZ4PE3j1Do0iOXxvPCF5ktRMALC9
X-Authority-Analysis: v=2.4 cv=cMnQdFeN c=1 sm=1 tr=0 ts=69f0e2dc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yneryZK0HH5dXzgVxAEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_093957_861122_1D31600F 
X-CRM114-Status: GOOD (  12.90  )
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

On 3/19/2026 7:26 AM, Jeff Johnson wrote:
> On 3/16/2026 10:14 AM, Daniel Lezcano wrote:
>> Instead of defining a local macro with a custom name for the QMI
>> service identifier, use the one provided in qmi.h and remove the
>> locally defined macro.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> Bjorn,
> Feel free to take this through your tree since I don't think it will conflict
> with anything in mine and it will take time for the definition to propagate
> back to my tree via the normal workflow (which I would prefer over merging the
> immutable branch).
> 
> Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Now NAK...

The definitions have now propagated back to my tree, so I'll now take this
patch through my tree.

/jeff

