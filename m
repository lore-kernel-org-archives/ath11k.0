Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF454C43217
	for <ath11k@archiver.kernel.org>; Wed,  2 Nov 2022 03:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GIV0TezVKVn1giEBjvq9EbBczLWM4ZC5yT5hCCU0F3c=; b=lmynpYnzDhTr0C
	SCH/aK/LUi2zdpj0Bf+XNus1aR5LGUMfRfUhYva8VBTifhB2cAiLXd2leoF6ThV2agauuLx4+oobR
	JR3Drs+RWBgioS30QQsnof/v+NsatkkuAe/BxIupLZ3vpQaqmru875g6rbfOcuiNM3HKJ7+3GEbdL
	yJQZtUms0QKw9IvwcGGgwWSp4G3AV2qJepOP//GPNiofF3y9OeQzZOkZxuoJ3nWjEQoN6eRgerTZV
	GJqaW4+84kltocFezm8fpYZd4U2Nt5GP8lNK300KKcaoYNFqfopLtVO5fX+ZM8kSy8Bm700AxK2tm
	lnr54zWajkLg8LObmBfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq4QO-0087JZ-ML; Wed, 02 Nov 2022 03:28:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq4QL-0087IZ-GE
	for ath11k@lists.infradead.org; Wed, 02 Nov 2022 03:28:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A226mLS006108;
	Wed, 2 Nov 2022 03:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=JMKf0yFfJ/EUEI0jPVKLy9oPtmYLoJuU7VfHNXHZHtE=;
 b=pWVmTT44tyDFpAF3bsIIhlrf+p3JfYIweAEjNVLg+F8BjW+339zm3RcC/4CAUgUYbXUp
 hfgdFN4RB32P/HURxVzLhdkZa0/fujaGOqZDgF7yxqqWfrG89n35e2PI7pXPGMlOrHku
 G4VGVNb1doi8sBtgtW38z4UCv6sGKTLPeF0IxfKEfVTfqTtZPiMsTxExU8hfjTGwo4nz
 79UHwY9lOzmJHALvs/LHuI+krdZhe1gGfLiiT2+fTFo5QSp6tP4HSCUqlYT7d+w4MK/U
 GW1jOBGZT7c807RDgPfSQ/gjYXqnQtmwuRbqayW82jP66URkB0KGY6OuifmyxQ5WeztF Qg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kk7nfh2x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 03:26:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A23QCuN025729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Nov 2022 03:26:12 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 1 Nov 2022
 20:26:11 -0700
Message-ID: <04ad44c0-4012-50a4-f24a-64723a1c0a4f@quicinc.com>
Date: Wed, 2 Nov 2022 11:26:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] mac80211: Add 802.11h CSA support
Content-Language: en-US
To: Sujith <Sujith.Manoharan@atheros.com>, <linville@tuxdriver.com>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>,
        <Jouni.Malinen@Atheros.com>, <ath11k@lists.infradead.org>
References: <18786.55021.734826.472061@gargle.gargle.HOWL>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <18786.55021.734826.472061@gargle.gargle.HOWL>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Fva6eJHitJ8FhqXY-PU8AdIiwyNOTKoY
X-Proofpoint-GUID: Fva6eJHitJ8FhqXY-PU8AdIiwyNOTKoY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_12,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_202817_707643_24EB6EDA 
X-CRM114-Status: GOOD (  18.75  )
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

T24gMS82LzIwMDkgMTE6NTggQU0sIFN1aml0aCB3cm90ZToKPiBNb3ZlIHRvIHRoZSBhZHZlcnRp
c2VkIGNoYW5uZWwgb24gcmVjZXB0aW9uIG9mCj4gYSBDU0EgZWxlbWVudC4gVGhpcyBpcyBuZWVk
ZWQgZm9yIDgwMi4xMWggY29tcGxpYW5jZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFN1aml0aCA8U3Vq
aXRoLk1hbm9oYXJhbkBhdGhlcm9zLmNvbT4KPiAtLS0KPiB2Mgo+IC0tCj4gKiBBZGQgYSBuZXcg
dmFyaWFibGUgdG8gaG9sZCB0aGUgQ1NBIGNoYW5uZWwKPiAqIFVzZSBtc2Vjc190b19qaWZmaWVz
IGZvciBjYWxjdWxhdGluZyBleHBpcmF0aW9uIHRpbWUKPiAqIEFkZCBhIGNoZWNrIHRvIGRyb3Ag
YmVhY29ucyBpbiBjYXNlIG9mIGEgZnJlcXVlbmN5IG1pc21hdGNoCj4KPiB2Mwo+IC0tCj4gKiBB
ZGQgYSBCU1NJRCBjaGVjayB3aGVuIGhhbmRsaW5nIENTQSBhY3Rpb24gZnJhbWUKPgo+ICAgbmV0
L21hYzgwMjExL2llZWU4MDIxMV9pLmggfCAgIDExICsrKysrKy0KPiAgIG5ldC9tYWM4MDIxMS9p
ZmFjZS5jICAgICAgIHwgICAgMiArCj4gICBuZXQvbWFjODAyMTEvbWxtZS5jICAgICAgICB8ICAg
MTMgKysrKysrKwo+ICAgbmV0L21hYzgwMjExL3J4LmMgICAgICAgICAgfCAgIDIwICsrKysrKysr
KysrCj4gICBuZXQvbWFjODAyMTEvc3BlY3RtZ210LmMgICB8ICAgNzcgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDUgZmlsZXMgY2hhbmdlZCwgMTIyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb25zKC0pCj4KPiAuLi4KPiArdm9pZCBpZWVlODAyMTFfcHJv
Y2Vzc19jaGFuc3dpdGNoKHN0cnVjdCBpZWVlODAyMTFfc3ViX2lmX2RhdGEgKnNkYXRhLAo+ICsJ
CQkJICBzdHJ1Y3QgaWVlZTgwMjExX2NoYW5uZWxfc3dfaWUgKnN3X2VsZW0sCj4gKwkJCQkgIHN0
cnVjdCBpZWVlODAyMTFfYnNzICpic3MpCj4gK3sKPiArCXN0cnVjdCBpZWVlODAyMTFfY2hhbm5l
bCAqbmV3X2NoOwo+ICsJc3RydWN0IGllZWU4MDIxMV9pZl9zdGEgKmlmc3RhID0gJnNkYXRhLT51
LnN0YTsKPiArCWludCBuZXdfZnJlcSA9IGllZWU4MDIxMV9jaGFubmVsX3RvX2ZyZXF1ZW5jeShz
d19lbGVtLT5uZXdfY2hfbnVtKTsKPiArCj4gKwkvKiBGSVhNRTogSGFuZGxlIEFESE9DIGxhdGVy
ICovCj4gKwlpZiAoc2RhdGEtPnZpZi50eXBlICE9IE5MODAyMTFfSUZUWVBFX1NUQVRJT04pCj4g
KwkJcmV0dXJuOwo+ICsKPiArCWlmIChpZnN0YS0+c3RhdGUgIT0gSUVFRTgwMjExX1NUQV9NTE1F
X0FTU09DSUFURUQpCj4gKwkJcmV0dXJuOwo+ICsKPiArCWlmIChzZGF0YS0+bG9jYWwtPnN3X3Nj
YW5uaW5nIHx8IHNkYXRhLT5sb2NhbC0+aHdfc2Nhbm5pbmcpCj4gKwkJcmV0dXJuOwo+ICsKTWF5
IEkga25vdyB3aHkgY2hhbm5lbCBzd2l0Y2ggc2hvdWxkIG5vdCBnbyBhaGVhZCB3aGlsZSBpdCBp
cyBkb2luZyBzY2FuPwpJdCBsZWFkIGNoYW5uZWwgc3dpdGNoIGZhaWwgc29tZXRpbWVzLgpGb3Ig
ZXhhbXBsZSwgY2hhbm5lbCBzd2l0Y2ggY291bnQgaXMgMTAsIHRoZW4gaXQgaGFzIDEwIGJlY2Fv
bnMgd2l0aCAKY2hhbm5lbCBzd2l0Y2ggSUUKaW4gdGhlIDEgc2Vjb25kLCBpZiBpdCBpcyBkb2lu
ZyBhIGh3IHNjYW4odGltZSBjb3N0IGlzIG1vcmUgdGhhbiAxIApzZWNvbmQpIGF0IHRoYXQgbW9t
ZW50LAp0aGUgY2hhbm5lbCBzd2l0Y2ggb2YgMTAgYmVhY29ucyB3aWxsIG5vdCBiZSBoYW5kbGUs
IGFuZCBsZWFkIGNoYW5uZWwgCnN3aXRjaCBmYWlsLgoKQ3VycmVudGx5IGl0IGlzIGNoYW5nZWQg
bGlrZSB0aGlzIGluIG5ldC9tYWM4MDIxMS9tbG1lLmMKaWVlZTgwMjExX3N0YV9wcm9jZXNzX2No
YW5zd2l0Y2goc3RydWN0IGllZWU4MDIxMV9zdWJfaWZfZGF0YSAqc2RhdGEsCi4uLgoKIMKgwqDC
oCBpZiAobG9jYWwtPnNjYW5uaW5nKQogwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwouLi4KCi0tIAph
dGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
