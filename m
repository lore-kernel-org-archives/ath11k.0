Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE58ECAAD5
	for <ath11k@archiver.kernel.org>; Mon, 12 Sep 2022 11:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGKfoqQp7Pmqe1tHiRNTDRRF7vGgJuCRbUhigmS4TT8=; b=PBA422E4kkP0Wn
	IHn5tWEqLp7mqK7dm3mBhE8YgW9TKAyE2pUHuyeh10MjTgUUM3uSW4k/RyB34NcUFDJ3SvoQBAlrl
	P7mVszcUH45CZ9dhG8LzVwVaVRlP9LUe5n/51TdwKS78z2uW8wfauIa+Ef1iyYTvdd5bComfUZJjP
	KodmOUDbW+wYR/JiE8GQKYwpG04iMWRd5MAW2NuSOKn3Cl7ExDmUGZhe3bIlH2dMffAT2xr68TdjZ
	cWScg2idKPDKtARK0MeXQQ3N9ZeolfPtTyXi4osADTe0BGzK5bKtmz5enVF1Q8IqQw1D6Wg9+wX9s
	RJu5u10W2WlhVTfBq+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXhCD-0096FA-FL; Mon, 12 Sep 2022 11:01:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXh63-0092p1-VT
	for ath11k@lists.infradead.org; Mon, 12 Sep 2022 10:55:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CAJbmD024623;
	Mon, 12 Sep 2022 10:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=q275b5LUVDGGXXw4R+fHCTyUOBz5XGxo5EGIvSA8X3I=;
 b=USZ0iOzV49YI6iX15mpbUZOxVIdNVPGUcyLQE94MJUYaY3h6gT4Ta7zKwd6oNZKuaceQ
 A85DWzmFYcxBN+wlPhTCNaadNHq9TAg6GDCkgHyzF8cb1so3M3sL0caLzTHeSfXA8q4n
 pagU1mZlX/jkY2ukfyxR3eS61FY0cf2Ls9nZuHajfZTraC6kQkZmDorBJg/f6pZv1cd1
 S75lbOLzFrea2ill51E9bKS7J77kxLupnpx+ayf73GDUjgyP2N4gwzB5fqFwYAk3e/my
 uT9nbEuMCaKqT53/rlE6Zcddq/iZLl9YFL5XpIJ3TmGqZkWACqp3w5BJE8RbdMm95u53 sw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jgk3bbrnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 10:55:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28CAt8Ve014042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 10:55:08 GMT
Received: from [10.253.8.149] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 12 Sep
 2022 03:55:07 -0700
Message-ID: <7199bd7d-b45c-5c72-576e-363ad37cce82@quicinc.com>
Date: Mon, 12 Sep 2022 18:55:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] wifi: mac80211: RCU-ify link STA pointers
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless
	<linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>
References: <24df3a0c-a312-d9b6-5840-1eacd79d824b@quicinc.com>
 <87a67498b4.fsf@kernel.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <87a67498b4.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g-XCu7vUToFqyK6tMtK1vpmUo00pNFQV
X-Proofpoint-GUID: g-XCu7vUToFqyK6tMtK1vpmUo00pNFQV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_06,2022-09-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_035524_210866_2B3C1899 
X-CRM114-Status: GOOD (  12.45  )
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

T24gOS8xMi8yMDIyIDY6NDkgUE0sIEthbGxlIFZhbG8gd3JvdGU6Cj4gV2VuIEdvbmcgPHF1aWNf
d2dvbmdAcXVpY2luYy5jb20+IHdyaXRlczoKPgo+PiBIaSBKb2hhbm5lcywKPj4KPj4gQ3VycmVu
dGx5IGZvciBNTE8gdGVzdCwgdGhlIG90aGVycyBsaW5rcydzIHJ4X25zcyBvZiBzdHJ1Y3QKPj4g
aWVlZTgwMjExX2xpbmtfc3RhIGlzIHN0aWxsIHZhbHVlIDAgaW4gaWVlZTgwMjExX3NldF9hc3Nv
Y2lhdGVkKCksCj4+IGJlY2F1ZSB0aGV5IGFyZSBub3QgcGFzcyBpbnRvIGllZWU4MDIxMV9zdGFf
c2V0X3J4X25zcygpIGluCj4+IG1hYzgwMjExIGV4Y2VwdCB0aGUgZGVmbGluayB3aGljaCBtZWFu
cyB0aGUgcHJpbWFyeSBsaW5rLgo+PiBUaGlzIGxlYWQgZHJpdmVyIGdldCBuc3MgPSAwIGZvciBv
dGhlciBsaW5rcy4gV2lsbCB5b3UgZml4IGl0Cj4+IG9yIGlzIGl0IGRlc2lnbiBieSBkZWZhdWx0
Pwo+Pgo+PiBPbmx5IHByaW1hcnkgbGluayBoYXMgdmFsaWQgcnhfbnNzIHZhbHVlIHdoaWNoIGlz
IG5vdCAwIGJ5IGJlbG93IGNhbGwgc3RhY2suCj4+IGllZWU4MDIxMV9hc3NvY19zdWNjZXNzKCkt
Pgo+PiAgwqDCoMKgIHJhdGVfY29udHJvbF9yYXRlX2luaXQoc3RhKTsKPj4KPj4gY29tbWl0OmM3
MTQyMGRiNjUzYWJhMzBhMjM0ZDFlNGNmODZkZGUzNzZlNjA0ZmEKPj4gd2lmaTogbWFjODAyMTE6
IFJDVS1pZnkgbGluayBTVEEgcG9pbnRlcnMKPiBTdHJhbmdlIGZvcm1hdCBhbmQgcy1vLWIgbWlz
c2luZy4gV2FzIHRoaXMgbWVhbnQgYXMgYW4gUkZDIHBhdGNoPwoKVGhpcyBpcyBub3QgYSBwYXRj
aCBmb3IgcmV2aWV3LCBpdCBpcyB0byBhc2sgc29tZSBxdWVzdGlvbiBhYm91dCB0aGUgcGF0Y2gK
CiJ3aWZpOiBtYWM4MDIxMTogUkNVLWlmeSBsaW5rIFNUQSBwb2ludGVycyIgd2hpY2ggaXMgYWxy
ZWFkeSB1cHN0cmVhbS4KCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDExawo=
