Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7918CD4F3F
	for <ath11k@archiver.kernel.org>; Fri, 22 Sep 2023 09:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2cliIJavN9C7X5Q9N5qO5jTa+YZF2B8pBdkudQZ23E=; b=WSV4HkqtchHTCr
	69xbqOn+ZRlB7XRC618cQ+QSWjIWnyyV6sMA3G5E31NGorVAgp/u+pADUSIz1bc27M8rc3dvAtM1S
	hMC3dg0SjK0fKlqVoWMxM0Hc0nH5CDg35rZdtuJr77G/7TQL8PRfKPyMCUzqgntqXCi5hz9I18Gwu
	B9kksJilyMJJlSpoRAWqz4X+EMyjx1I6bvCol8mLo01ZKZ803ZjeD5qmMZqt7C32Nqxhe2xSWMkC/
	uVVIsjVLeN/kQPBN+zlpj7BrkA4YTGRXCCSx2yb/nRHlPRHN8xuG559fkSWrOZwLtPq8oYJT4ADjr
	E+aP0aQSCrKa1mBtS9FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcIc-008YD0-0q;
	Fri, 22 Sep 2023 09:18:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcIY-008YB3-3A
	for ath11k@lists.infradead.org;
	Fri, 22 Sep 2023 09:18:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38M79Znr032765;
	Fri, 22 Sep 2023 09:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LonnscLcKZUYt42xOOi1psonh9Iz49FVeWCDCAFBj8g=;
 b=W5u1HdwKAF5fdIVs5FVunxpAeSF1yTX9oUdW+5SZoLySXXlC3rKBfCBny/a13u3i/Tm9
 EG4sru7wFOprOeI2xxQKux3WjIg5CN0SHEIn5cbfC2rGlvaKt42GQLGg87ZPM+3j/BrX
 Zu+7hV9AlEhC6Os5upQ5Xc3bXM/Ik8q3yx416hqIwmnGcdNLYu/NuivP7/ANzYG8AYXO
 W5zTmVgggXyH3tb7ZedaQRfJuPS+oiOBZTuXWk0Wqz3gaCcYE739UOeXk7irTWZj+bJE
 zgK4O034Mi5Rz16uDvzU0SvI0RJp1UGm4EB2XzbtTnX6Cg72KZuyhOvbFpAKzxOkLSQi Pg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8u9h9chs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 09:17:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38M9Hu8U017218
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 09:17:56 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 02:17:54 -0700
Message-ID: <1a52925f-0b18-9c42-4005-47de075ce1d0@quicinc.com>
Date: Fri, 22 Sep 2023 17:17:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 11/13] wifi: ath11k: discard BSS_CHANGED_TXPOWER when
 EXT_TPC_REG_SUPPORT for 6 GHz
Content-Language: en-US
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-12-quic_wgong@quicinc.com>
 <4e4024eb-b518-4a36-b230-3c413c3a06e8@quicinc.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <4e4024eb-b518-4a36-b230-3c413c3a06e8@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fQVxZAipyfNEyevbZJZ80AC_k5ryocOY
X-Proofpoint-ORIG-GUID: fQVxZAipyfNEyevbZJZ80AC_k5ryocOY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_07,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 mlxlogscore=878 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309220076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_021807_194680_A1648BB0 
X-CRM114-Status: GOOD (  14.23  )
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

T24gOS8yMi8yMDIzIDU6MDQgUE0sIEFkaXR5YSBLdW1hciBTaW5naCB3cm90ZToKPiBPbiA5LzIw
LzIzIDEzOjUzLCBXZW4gR29uZyB3cm90ZToKPj4KWy4uLl0KPj4gQEAgLTM1OTUsOSArMzYwNywx
MyBAQCBzdGF0aWMgdm9pZCAKPj4gYXRoMTFrX21hY19vcF9ic3NfaW5mb19jaGFuZ2VkKHN0cnVj
dCBpZWVlODAyMTFfaHcgKmh3LAo+PiDCoMKgwqDCoMKgIGlmIChjaGFuZ2VkICYgQlNTX0NIQU5H
RURfVFhQT1dFUikgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYXRoMTFrX2RiZyhhci0+YWIsIEFU
SDExS19EQkdfTUFDLCAidmRldl9pZCAlaSB0eHBvd2VyICVkXG4iLAo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBhcnZpZi0+dmRldl9pZCwgaW5mby0+dHhwb3dlcik7Cj4+IC0K
Pj4gLcKgwqDCoMKgwqDCoMKgIGFydmlmLT50eHBvd2VyID0gaW5mby0+dHhwb3dlcjsKPj4gLcKg
wqDCoMKgwqDCoMKgIGF0aDExa19tYWNfdHhwb3dlcl9yZWNhbGMoYXIpOwo+PiArwqDCoMKgwqDC
oMKgwqAgaWYgKGF0aDExa19tYWNfc3VwcG9ydHNfc3RhdGlvbl90cGMoYXIsIGFydmlmLCAKPj4g
JmluZm8tPmNoYW5kZWYpKSB7Cj4gU28gZXZlbiBpZiB1c2VyIHdhbnRzIHRvIG9wZXJhdGUgaW4g
bG93IHBvd2VyIHZhbHVlLCB3ZSB3b24ndCBiZSAKPiBhbGxvd2luZyB0byBkbyB0aGF0IGluIGNh
c2Ugb2YgNiBHSHogc3RhdGlvbiBtb2RlPyBPbmx5IFRQQyBwb3dlciBpcyAKPiB2YWxpZD8KPgpZ
b3UgYXJlIHJpZ2h0LiBJIHRoaW5rIEkgd2lsbCBkcm9wIHRoaXMgcGF0Y2guIEZpcm13YXJlIHdp
bGwgc2VsZWN0IHRoZSAKbG93ZXN0IFRYIHBvd2VyIGZyb20gbXVsdGktc291cmNlLgo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBhdGgxMWtfZGJnKGFyLT5hYiwgQVRIMTFLX0RCR19NQUMsCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImRpc2NhcmQgdHggcG93ZXIs
IGNoYW5nZSB0byBzZXQgVFBDIHBvd2VyXG4iKTsKPj4gK8KgwqDCoMKgwqDCoMKgIH0gZWxzZSB7
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFydmlmLT50eHBvd2VyID0gaW5mby0+dHhwb3dl
cjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXRoMTFrX21hY190eHBvd2VyX3JlY2FsYyhh
cik7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoCDCoMKgwqDCoMKg
IGlmIChjaGFuZ2VkICYgQlNTX0NIQU5HRURfUFMgJiYKPgo+CgotLSAKYXRoMTFrIG1haWxpbmcg
bGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
