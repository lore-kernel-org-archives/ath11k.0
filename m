Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4B2C76195
	for <ath11k@archiver.kernel.org>; Tue, 28 Mar 2023 10:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CzHb5iH+Q7ZssjHEXitsxNyVjWEUjRYMkILUjU/Qgg4=; b=CfESnEkBMbIflf
	Fpt5cMAYtjiVPGGEs691UhAtgIrGXY6+WCB7u63giUI3EmHGr5pPwM8Z1sotZdNw/Pf7/ok/ftFx4
	O5CiHA/F3p5K7lZMJcLfiV2xGAnOyxDt74M4FLLWiFqonZ6qnTZbqU7lpX6ke8rpMzciZLY3qm87B
	giiiUChtn+vd4UdN6b6A88K3MxXdeAuz9MPK0qQMmQF7aiQ93RAsaQdZWUtvzfINLeyEHkt3Em2uy
	0aVkXd39Fc1OJlKCwZMwviN81FoxTGwv0kgyrnMyI2xh69820PkxI6DQ8oMAZ/QXrbCAYKCrywHNr
	m1RK1ldpRBAJgFaGku2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph6Fm-00DrBn-01;
	Tue, 28 Mar 2023 10:08:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph6Fe-00Dr7Y-39;
	Tue, 28 Mar 2023 10:08:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32S6Wgux024423;
	Tue, 28 Mar 2023 10:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YEtdMWxFvwJB9IFe9RCVqd16TmzhWL46GUN6XDDo+Kk=;
 b=fVzx/jMYW0Qu26YD1whXXgytbmMskMWIIx5zuJnTUGr0DL0lGMdUGa4+9wAqMF/phhfi
 5d+ca8rSH0QKcKZhw23i8EjaWEo0urCNdlBxbqxl2qyVPy9dPwLFveXgPrxFCSZUhqWQ
 gsT9F1Jdfw7WxsVUjB5aHvxdqc8xj/yucSIN/UhZU9CEk3ulQRrSZyA3P6UcDZVmRWjr
 nsfRTJvqrJT08EhL6XsBT2Ve7ODBR/y5YFcPKvzV9A5GdkNEu44XoeDCMd7kROQPheKh
 M40ZHSpbkrGvdG9VS2HBu6XLdd9reJGz/Zp3ppZsrgCxOhYsGrp03p4kNNg5aZMiLmmX TQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pkbywan8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 10:08:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32SA8NDS020614
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 10:08:23 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 28 Mar
 2023 03:08:22 -0700
Message-ID: <1ad3d3de-81b6-200b-edd8-10f3c5345aaf@quicinc.com>
Date: Tue, 28 Mar 2023 18:08:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/5] SME: Add support for handling authentication with
 MLD
Content-Language: en-US
To: Andrei Otcheretianski <andrei.otcheretianski@intel.com>,
        <hostap@lists.infradead.org>
CC: Ilan Peer <ilan.peer@intel.com>,
        "ath11k@lists.infradead.org"
	<ath11k@lists.infradead.org>
References: <20221206094609.104911-1-andrei.otcheretianski@intel.com>
 <20221206094609.104911-2-andrei.otcheretianski@intel.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20221206094609.104911-2-andrei.otcheretianski@intel.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DfPHsXpiajYiu8bYn7PElhH5hBLKpxRU
X-Proofpoint-ORIG-GUID: DfPHsXpiajYiu8bYn7PElhH5hBLKpxRU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_030827_030207_B194BB26 
X-CRM114-Status: GOOD (  14.51  )
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

T24gMTIvNi8yMDIyIDU6NDYgUE0sIEFuZHJlaSBPdGNoZXJldGlhbnNraSB3cm90ZToKLi4uCj4g
ZGlmZiAtLWdpdCBhL3dwYV9zdXBwbGljYW50L3NtZS5jIGIvd3BhX3N1cHBsaWNhbnQvc21lLmMK
PiBpbmRleCBmNmFjZTM3NjA2Li5hNDQwNDQwNzllIDEwMDY0NAo+IC0tLSBhL3dwYV9zdXBwbGlj
YW50L3NtZS5jCj4gKysrIGIvd3BhX3N1cHBsaWNhbnQvc21lLmMKPiBAQCAtMzY3LDYgKzM2Nywx
OTQgQEAgc3RhdGljIHZvaWQgc21lX2F1dGhfaGFuZGxlX3JybShzdHJ1Y3Qgd3BhX3N1cHBsaWNh
bnQgKndwYV9zLAo+ICAgfQo+ICAgCj4gICAKPiArc3RhdGljIGJvb2wgd3Bhc19tbF9lbGVtZW50
KHN0cnVjdCB3cGFfc3VwcGxpY2FudCAqd3BhX3MsIHN0cnVjdCB3cGFfYnNzICpic3MpCj4gLi4u
Cj4gKwkJCWlmIChuZWlnaF9ic3MpIHsKPiArCQkJCWlmICh3cGFfc2Nhbl9yZXNfbWF0Y2god3Bh
X3MsIDAsIG5laWdoX2JzcywKPiArCQkJCQkJICAgICAgIHdwYV9zLT5jdXJyZW50X3NzaWQsCj4g
KwkJCQkJCSAgICAgICAxLCAwKSkgewpJZiB3cGFfc2Nhbl9yZXNfbWF0Y2goKSBmYWlsLCB0aGVu
IHRoZSBuZWlnaF9ic3Mgd2lsbCBiZSBkcm9wcGVkLCBhbmQgCnRoZSBuZWlnaCBsaW5rIHdpbGwg
Tk9UIGNvbm5lY3QsIHRoZW4gTiBsaW5rIHJlZHVjZWQgdG8gTi0xIGxpbmsuCgpmb3IgZXhhbXBs
ZSwgdGhlIGJzc2lkIGZhaWxlZCBjb25uZWN0IGZvciBsYXN0IHRpbWUsIGl0IHdpbGwgYmUgaWdu
b3JlZCAKZm9yIDEwIHNlY29uZHM6CkZlYiAxMyAxNzo0MjoyMCBjc3QtQ2VsYWRvbi1STiB3cGFf
c3VwcGxpY2FudFs5NjddOiBBZGRlZCBCU1NJRCAKMDA6MDM6N2Y6MDE6NTk6NTAgaW50byBpZ25v
cmUgbGlzdCwgaWdub3JpbmcgZm9yIDEwIHNlY29uZHMKRmViIDEzIDE3OjQyOjIwIGNzdC1DZWxh
ZG9uLVJOIHdwYV9zdXBwbGljYW50Wzk2N106IEJTU0lEIAowMDowMzo3ZjowMTo1OTo1MCBpZ25v
cmUgbGlzdCBjb3VudCBpbmNyZW1lbnRlZCB0byAyLCBpZ25vcmluZyBmb3IgMTAgCnNlY29uZHMK
RmViIDEzIDE3OjQyOjIxIGNzdC1DZWxhZG9uLVJOIHdwYV9zdXBwbGljYW50Wzk2N106IHdsYW4w
OsKgwqDCoCBza2lwIC0gCkJTU0lEIGlnbm9yZWQgKGNvdW50PTIgbGltaXQ9MCkKPiArCQkJCQl3
cGFfcy0+dmFsaWRfbGlua3MgfD0gQklUKGxpbmtfaWQpOwo+ICsJCQkJCW9zX21lbWNweSh3cGFf
cy0+bGlua3NbbGlua19pZF0uYnNzaWQsCj4gKwkJCQkJCSAgYXBfaW5mby0+ZGF0YSArIDEsIEVU
SF9BTEVOKTsKPiArCQkJCQl3cGFfcy0+bGlua3NbbGlua19pZF0uZnJlcSA9Cj4gKwkJCQkJCW5l
aWdoX2Jzcy0+ZnJlcTsKPiArCQkJCX0gZWxzZSB7Cj4gKwkJCQkJd3BhX3ByaW50ZihNU0dfREVC
VUcsCj4gKwkJCQkJCSAgICJNTEQ6IG5laWdoYm9yIGRvZXNuJ3QgbWF0Y2ggY3VycmVudCBTU0lE
IC0gc2tpcCBsaW5rIik7Cj4gKwkJCQl9Cj4gKwkJCX0gZWxzZSB7Cj4gKwkJCQl3cGFfcHJpbnRm
KE1TR19ERUJVRywKPiArCQkJCQkgICAiTUxEOiBuZWlnaGJvciBub3QgZm91bmQgaW4gc2NhbiIp
Owo+ICsJCQl9Cj4gKwkJfQouLi4KCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTFrCg==
