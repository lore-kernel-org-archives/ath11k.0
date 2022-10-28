Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48ED1C38A02
	for <ath11k@archiver.kernel.org>; Fri, 28 Oct 2022 10:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qhQ3JTrcC9o/RxKZHiIy3PvpkDN5gYflb4JNzuYGx+k=; b=J/T7GCPD5jhh9A
	Fuox1lFoS5X9S9dRAEAX+VrRKCTqAdnpVxF5vacq/gYYeNjLrQGk6VnIVI5jXLYKkhNZYffZ4OlYx
	4tUWzTWfNzHMa0k2XAOGotAmzkb3QqYjBFg8RcaWWlDKqHtgSmdkY27cxYbFiAd3LlJpDqS1KFtC+
	eANdWBVnWkU1mvhDNd5slIpt7hZR90zvR6m8cAh6YKwrCC8+wHdrkhUl33SPYCphdi2linptlLge/
	3wsQMimtJBP04DsgsAUpNdfCEAq+c76XZmsUVutaO/z/qF0VhDCUD3UjqtQFi33houqs9PJV9182L
	b8xVdARrQTn7Hx4JuRew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMvq-00GluM-77; Fri, 28 Oct 2022 10:49:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMvm-00Glsk-Lq
	for ath11k@lists.infradead.org; Fri, 28 Oct 2022 10:49:44 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29S2vX6A023698;
	Fri, 28 Oct 2022 10:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ki/HDFBEbGCIzidKvmwtO++x//ZgFLhXULCVRCmMbP4=;
 b=k4aXG4JJMmtq3KoiZmtTtb1nJEkTLynwD7utSLfOs6li+CjcJX6/A5HCDCuSUn0CR0lV
 gG+N6SQs9fsMsM53E8zh2Eij5iO4C5P+NBC84yRD7JPU4wwydrZYSqKCn609uq3baEt8
 t5hOh7k3vrRntmt6AaGyWNRSATqpMhoAIXhwH7om7u32VOITrkvecjXxHemM5Bm0JXGA
 q52zwmdo5kWu6Jsa3Y71l7DJEmAEniSyUb3tjXDjC2mbA4ktKVxyN1gBD4FYXA1bUUdA
 Ssft39KZ10AhIpbtXD3dYLPnP968weBGuRwIqX2Qd7EPsTYhBxx/alP030jYbZTDDIve lg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kg0wmt1rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 10:49:35 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29SAnYXB019185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 10:49:34 GMT
Received: from [10.242.243.152] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 28 Oct
 2022 03:49:32 -0700
Message-ID: <bc7b8787-f7a6-501f-4740-3a9a06cdad9a@quicinc.com>
Date: Fri, 28 Oct 2022 16:19:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] wifi: ath11k: Fix qmi_msg_handler data structure
 initialization
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>,
        "Joseph S. Barrera III"
	<joebar@chromium.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20221021090126.28626-1-quic_rbhattac@quicinc.com>
 <11e005c2-2363-d63f-9f3f-3ca811737231@chromium.org>
 <87pmecgrd2.fsf@kernel.org>
From: Rahul Bhattacharjee <quic_rbhattac@quicinc.com>
In-Reply-To: <87pmecgrd2.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JUB4RRJKF_f52IxC370-jEPMNCOCk_v2
X-Proofpoint-GUID: JUB4RRJKF_f52IxC370-jEPMNCOCk_v2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_05,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=972 spamscore=0 phishscore=0 mlxscore=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_034942_758610_EDA9D23A 
X-CRM114-Status: GOOD (  14.52  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


On 10/28/2022 4:14 PM, Kalle Valo wrote:
> "Joseph S. Barrera III" <joebar@chromium.org> writes:
>
>> On 10/21/22 2:01 AM, Rahul Bhattacharjee wrote:
>>
>>>    	},
>>> +	{/* end of list */}
>>>    };
>> Do you want to add a comma after that last list element?
> I can add that in the pending branch.
>
>> Actually, I normally see the last list element simply being
>>
>>> +	{},
>> ... with no comment necessary.
> I would prefer to have a comment to make it more visible that an empty
> element is needed at the end, but I would add that outside of braces?
>
> /* end of list */
> {},
>
> Thoughts? I can change this in the pending branch.

LGTM!

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
