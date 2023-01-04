Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02779C4332F
	for <ath11k@archiver.kernel.org>; Wed,  4 Jan 2023 06:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8POUXBfI/EmWfqvU98uAmlxnitNLbLWAz3v+KmUSyuo=; b=mM9zgqFXltVvQb
	uBKDOLD42Y0Xma53SZBk5GqFtlLTg4vlL//oX9Ka1qJLdqSIFiDPDn/9DmDqPZ8JACfjxXj6PAZbq
	gTn/L3WHXy4ytE7SwKmbAdPPj117zUHmBf/L4oOCLGRPw5bTU3EvdcvhemiCQLdu9FyHp7d9aCtaG
	Ti5VzuqikvhTfaFurKW/GXM6sNdHq2P5ol5qZhrsNgUVCl5DDcCTo0KQHcLngyHIgOitaMkK1kGlr
	joJPZacHPh+GG7QAnF/TWXvHmNSQ+q8454MRknDE622xeJhfKuvEnr3Licz4JJYjXUH3FCtWj7PaU
	eGf6UN1xZOuXMZds3Vlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCxgs-007IBE-Mf; Wed, 04 Jan 2023 06:55:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCxfg-007I0o-V9
	for ath11k@lists.infradead.org; Wed, 04 Jan 2023 06:54:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30465VgA014170;
	Wed, 4 Jan 2023 06:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=q0e+ty/NwxjTofsj/BXtvw39vsl9bNcz6AiQYUG62R0=;
 b=i5eYhi0t+QVyMol7mIzPHyd9QrzlDoUlc7uknSF5Zbm3sYxvZMEZHGZwdwZQor7SnD+F
 m6ZKqGN41+32Y52LD2zv7IrxwNosgC6Fq/8rzhV0p08ouM31sJmHWKSJwiNNMbR42ieG
 PH/kJxAojjiAPz/QeVh28LIb3pbTvnLZO4PJgfUSKN7AQWdGBZg6aUfzHOxw008QGj0X
 0mcciP3CBLIiZkWYpsM3H4E5nk9JDVk2Bx/3V0Tt85AkRritFwGQeCB27TKJ+u0fA0pR
 gOIyY2GmlTwgt3p2mpk22agFwG6N7M+9vrxSZod91xJykobdNgobRxspi42BbFY2AQie XQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mvsw315m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 06:54:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3046se1F018037
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Jan 2023 06:54:40 GMT
Received: from [10.216.48.166] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 3 Jan 2023
 22:54:38 -0800
Message-ID: <b059a91d-ad43-4ae4-ba48-428bb533d12d@quicinc.com>
Date: Wed, 4 Jan 2023 12:24:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] wifi: ath11k: Set ext passive scan flag to adjust passive
 scan start time
Content-Language: en-US
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20221222131720.11368-1-quic_tamizhr@quicinc.com>
 <e11e4312-d373-ba54-6d48-a9c471f78532@quicinc.com>
 <61261415-b98b-7476-fd55-3141a26d0dd6@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <61261415-b98b-7476-fd55-3141a26d0dd6@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N4xeRAsNDkaDwtCWgRXBstb8kTPeFBP-
X-Proofpoint-ORIG-GUID: N4xeRAsNDkaDwtCWgRXBstb8kTPeFBP-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_03,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxlogscore=989 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301040057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_225445_204220_101A3830 
X-CRM114-Status: GOOD (  10.84  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

CgpPbiAxLzQvMjAyMyAxMDoyNiBBTSwgVGFtaXpoIENoZWx2YW0gUmFqYSB3cm90ZToKPiBPbiAx
LzIvMjAyMyAzOjQ5IFBNLCBWYXNhbnRoYWt1bWFyIFRoaWFnYXJhamFuIHdyb3RlOgo+Pgo+Pgo+
PiBPbiAxMi8yMi8yMDIyIDY6NDcgUE0sIFRhbWl6aCBDaGVsdmFtIFJhamEgd3JvdGU6Cj4+PiBT
ZXQgdGhlIFdNSV9TQ0FOX0ZMQUdfRVhUX1BBU1NJVkVfU0NBTl9TVEFSVF9USU1FX0VOSEFOQ0Ug
ZmxhZwo+Pj4gd2hpbGUgc2VuZGluZyB0aGUgc2NhbiBjb21tYW5kLsKgIElmIHRoaXMgZmxhZyBp
cyBlbmFibGVkIHdoZW4gdGhlCj4+PiBpbmNvbWluZyBzY2FuIHJlcXVlc3QgY29tZXMgd2l0aCBh
IHN0cmljdCBzdGFydCB0aW1lIGFuZCBpdHMgZHVyYXRpb24KPj4+IG92ZXJsYXBzIHdpdGggbmV4
dCBUQlRULCB0aGVuIHRhcmdldCBhZGp1c3QgdGhlIHN0YXJ0IHRpbWUgYWNjb3JkaW5nbHkKPj4+
IGZvciBwYXNzaXZlIHNjYW4uIFRhcmdldCBzdXBwb3J0aW5nIHRoaXMgZmVhdHVyZSB3aWxsIGFk
dmVydGlzZQo+Pj4gV01JX1RMVl9TRVJWSUNFX1BBU1NJVkVfU0NBTl9TVEFSVF9USU1FX0VOSEFO
Q0UuCj4+Pgo+Pj4gVGVzdGVkLW9uOiBJUFE4MDc0IGh3Mi4wIEFIQiBXTEFOLkhLLjIuNC4wLjEt
MDE0NjctUUNBSEtTV1BMX1NJTElDT05aLTEKPj4+Cj4+Cj4+IElmIHRoaXMgY2hhbmdlIGZpeGVz
IGFueSB1c2VyIHZpc2libGUgaXNzdWUsIGJldHRlciB0byBpbmNsdWRlIHRoYXQgZGV0YWlscy4K
Pj4KPiBUaGVyZSBhcmUgbm8gdXNlciB2aXNpYmxlIGlzc3VlcyB3aXRob3V0IHRoaXMgY2hhbmdl
Lgo+IAo+IAoKRmluZSwgdGhhbmtzIQoKVmFzYW50aAoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QK
YXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMWsK
