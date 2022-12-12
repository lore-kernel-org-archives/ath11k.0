Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BD4C4332F
	for <ath11k@archiver.kernel.org>; Mon, 12 Dec 2022 08:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GW6603/Be+IXi6XnPe8jp4mI8fgzeIo+vm8sP2YelNw=; b=jb0nWRivyvrrK7
	NZnKq25AjBBnFe/PJI31H4Pte6uiJM9hwzYWse8qxB8uiSOa5j6EnNxreOZo16dIBDMS3nbLVwubr
	qZV+1jKsmswbjEUsGeCQ3RdHZTA2cKJZ2mVZP/no6BiR4PkMZz6fOLvsLg8ykK5TXYvB3Tx+V0Dz1
	ieM9hmVtFwv7POyE2423VEUSpdkOkkeE/nVDykXpzGIJp84yhW5IbysTP6UCW+amQxQV9qmykwBaB
	JpfwQImyOO2775/RNAWkxHuOr6WYeDT5mifLJxB+LU5nWqoMlRalYP6mI6Gx8Flg/TARdlNHNaVKI
	ovx8yKyFcv8Qir6vJJMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4eDt-00ABQB-Nf; Mon, 12 Dec 2022 08:31:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4eDq-00ABBm-Bj
	for ath11k@lists.infradead.org; Mon, 12 Dec 2022 08:31:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BC4vmaF001093;
	Mon, 12 Dec 2022 08:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=uLukQXnW7qTf2gG7t76e726ocOVRjK3PcZw8x4yvRXM=;
 b=g47ILgnLAlMsFq3QOmT5lv+oh/S4/DNke22RVTUVZCqqf69an0mRpWzAon3rsrS90G5i
 b/bKPlCQIYHEMNj5B2w25VxRu9KR/y4tUh+vqqX4myyxtpoulngkALByPCiqX4wfdspQ
 YaLaj+DXuyt6JeRWcvtoVnSQLZJhTdiOaVB/qj2kyqeWunaMb/n9EtViF7Zg+P5li6xN
 +vovgp+zTkij8gzcNCSF2P5CEwlfbuXfHVET2K8C5nn3HYc9eRrrDN80kEt+/Se8pFXJ
 eG28lIg4LejADh6vNaAxbJKRN9CK2uc7gSCa+0TDX20Z49T/cYk1DEf89WE55jsxNpxI Ow== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mch30kjp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Dec 2022 08:31:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BC8VUPi005923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Dec 2022 08:31:30 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 12 Dec
 2022 00:31:28 -0800
Message-ID: <e42f6580-b113-46ed-2fc0-cf3cdc099c7b@quicinc.com>
Date: Mon, 12 Dec 2022 16:31:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 4/5] mac80211: run late dequeue late tx handlers without
 holding fq->lock
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: <johannes@sipsolutions.net>, <ath11k@lists.infradead.org>,
        <johannes.berg@intel.com>
References: <20190316170634.13125-1-nbd@nbd.name>
 <20190316170634.13125-4-nbd@nbd.name>
 <9bce39db-1de4-f129-8d2f-77f51a64a5db@quicinc.com>
 <a918d3ee-edc7-b6a2-d15a-e0d77f0683e2@quicinc.com>
In-Reply-To: <a918d3ee-edc7-b6a2-d15a-e0d77f0683e2@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8UBPuGyZ2_LT_8FAqRHHpFs0Xa2ULh09
X-Proofpoint-GUID: 8UBPuGyZ2_LT_8FAqRHHpFs0Xa2ULh09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_01,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=892
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_003138_429791_8EA999B9 
X-CRM114-Status: GOOD (  16.17  )
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

SSB3aWxsIHNlbmQgYSBwYXRjaCBmb3IgaXQgdG8gYXZvaWQgdGhlIHBvdGVudGlhbCB1c2VyLWFm
dGVyLWZyZWUgcmlzay4KCk9uIDEyLzcvMjAyMiAyOjMwIFBNLCBXZW4gR29uZyB3cm90ZToKPiBI
aSBKb2hhbm5lcywKPgo+IGRvIHlvdSBrbm93IGl0Pwo+Cj4gT24gMTIvNS8yMDIyIDU6NDYgUE0s
IFdlbiBHb25nIHdyb3RlOgo+PiBPbiAzLzE3LzIwMTkgMTowNiBBTSwgRmVsaXggRmlldGthdSB3
cm90ZToKPj4+IFJlZHVjZXMgbG9jayBjb250ZW50aW9uIG9uIGVucXVldWUvZGVxdWV1ZSBvZiBp
VFhRIHBhY2tldHMKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBGaWV0a2F1IDxuYmRAbmJk
Lm5hbWU+Cj4+PiAtLS0KPj4+IMKgIG5ldC9tYWM4MDIxMS90eC5jIHwgMTAgKysrKysrKystLQo+
Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvbmV0L21hYzgwMjExL3R4LmMgYi9uZXQvbWFjODAyMTEvdHguYwo+
Pj4gaW5kZXggODEyN2U0M2UxMmIxLi5mODUzNDRjOWFmNjIgMTAwNjQ0Cj4+PiAtLS0gYS9uZXQv
bWFjODAyMTEvdHguYwo+Pj4gKysrIGIvbmV0L21hYzgwMjExL3R4LmMKPj4+IEBAIC0zNTQ0LDYg
KzM1NDQsNyBAQCBzdHJ1Y3Qgc2tfYnVmZiAqaWVlZTgwMjExX3R4X2RlcXVldWUoc3RydWN0IAo+
Pj4gaWVlZTgwMjExX2h3ICpodywKPj4+IMKgwqDCoMKgwqAgaWVlZTgwMjExX3R4X3Jlc3VsdCBy
Owo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgaWVlZTgwMjExX3ZpZiAqdmlmID0gdHhxLT52aWY7Cj4+
PiDCoCArYmVnaW46Cj4+PiDCoMKgwqDCoMKgIHNwaW5fbG9ja19iaCgmZnEtPmxvY2spOwo+PiBN
YXliZSB1c2UtYWZ0ZXItZnJlZSB3aWxsIGhhcHBlbmVkPwo+Pgo+PiBZb3UgY2FuIHNlZSBpZWVl
ODAyMTFfdHhfZGVxdWV1ZSgpIGluIHR4LmMgYXMgYmVsb3csIGFmdGVyIAo+PiBpZWVlODAyMTFf
ZnJlZV90eHNrYigpLCBpdCB3aWxsIGdvdG8gYmVnaW4sCj4+IElmIGdvdG8gb3V0IGhhcHBlbmVk
IGluIGJlbG93IGNoZWNrLCB0aGVuIHRoZSBza2Igd2hpY2ggaXMgZnJlZWQgd2lsbCAKPj4gYmUg
cmV0dXJuZWQsIGFuZCB1c2UtYWZ0ZXItZnJlZSB3aWxsIGhhcHBlbi4KPj4KPj4gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQva3ZhbG8vYXRoLmdpdC90cmVl
L25ldC9tYWM4MDIxMS90eC5jP2lkPWRlZDQ2OThiNThjYjIzYzIyYjBkY2JkODI5Y2VkMTljZTRl
NmNlMDIjbjM1MzggCj4+Cj4+IGJlZ2luOgo+PiDCoMKgIMKgc3Bpbl9sb2NrX2JoKCZmcS0+bG9j
ayk7Cj4+Cj4+IMKgwqAgwqBpZiAodGVzdF9iaXQoSUVFRTgwMjExX1RYUV9TVE9QLCAmdHhxaS0+
ZmxhZ3MpIHx8Cj4+IMKgwqAgwqDCoMKgwqAgdGVzdF9iaXQoSUVFRTgwMjExX1RYUV9TVE9QX05F
VElGX1RYLCAmdHhxaS0+ZmxhZ3MpKQo+PiDCoMKgIMKgwqDCoMKgIGdvdG8gb3V0Owo+Pgo+PiDC
oMKgIMKgaWYgKHZpZi0+dHhxc19zdG9wcGVkW2llZWU4MDIxMV9hY19mcm9tX3RpZCh0eHEtPnRp
ZCldKSB7Cj4+IMKgwqAgwqDCoMKgwqAgc2V0X2JpdChJRUVFODAyMTFfVFhRX1NUT1BfTkVUSUZf
VFgsICZ0eHFpLT5mbGFncyk7Cj4+IMKgwqAgwqDCoMKgwqAgZ290byBvdXQ7Cj4+IMKgwqAgwqB9
Cj4+Cj4+IMKgwqAgwqAvKiBNYWtlIHN1cmUgZnJhZ21lbnRzIHN0YXkgdG9nZXRoZXIuICovCj4+
IMKgwqAgwqBza2IgPSBfX3NrYl9kZXF1ZXVlKCZ0eHFpLT5mcmFncyk7Cj4+IMKgwqAgwqBpZiAo
c2tiKQo+PiDCoMKgIMKgwqDCoMKgIGdvdG8gb3V0Owo+Pgo+PiDCoMKgIMKgc2tiID0gZnFfdGlu
X2RlcXVldWUoZnEsIHRpbiwgZnFfdGluX2RlcXVldWVfZnVuYyk7Cj4+IMKgwqAgwqBpZiAoIXNr
YikKPj4gwqDCoCDCoMKgwqDCoCBnb3RvIG91dDsKPj4KPj4gwqDCoCDCoHNwaW5fdW5sb2NrX2Jo
KCZmcS0+bG9jayk7Cj4+Cj4+IE1heWJlICJza2IgPSBOVUxMOyIgc2hvdWxkIGJlIGFkZGVkIGFm
dGVyICJiZWdpbjoiLgo+Pgo+PiAuLi4KPj4KCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDEx
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTFrCg==
