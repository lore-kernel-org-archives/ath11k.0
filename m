Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036A2C433FE
	for <ath11k@archiver.kernel.org>; Tue, 11 Oct 2022 02:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7c2KpUXEdS/MDJujzVj6A0AmTz7EGqF+DqLzGYRg5rw=; b=jgwvRMh8GnZ5Rm
	OtEN+BXAtDDrTOBcCWe+I8SRPSxMaVB52h5uyR5LaYwXHM4tKfTeo5NOWu1D46FefAq+nrEf0774n
	0JCPeYdfJABOBnsFGg8INuYSmc5TRrfL69KDdYy2+OqsFynGzLoySK1L6IshUirJKVGdVMr3GPc7n
	5AxnYhjs3ilUXJRg7FY6fv0YHQ3obpr+fOL4vg2duS4DYuu6c1D+3ctPfcYE00LD+RallCLQ+2klm
	fsmocm1qK6rQQ7SYMQAJTK2qWYAnB6d5UEOlmWVxgCL8UdAhhcf+lKqBYEiYfu3Cy/RL0Blm9ZZh3
	OvepCWpVDlk4i4n17+2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi50W-0031GE-OY; Tue, 11 Oct 2022 02:28:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi50U-0031FV-4T
	for ath11k@lists.infradead.org; Tue, 11 Oct 2022 02:28:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B2EYK5006524;
	Tue, 11 Oct 2022 02:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lDVOT3gWzcE/ugYWnD3R2HCAa38o2zK8bwba2ar4P68=;
 b=p8Qt4c+bIA8ONoOTn2ITsSwyjWN6hPVcpKsqc8BsCrPUIkbPEmjd4UzRfznLrkX9PQRv
 aZA98WPHnsnL2UZRrEuG3KjOx/6fLguwnjSv9sKNwUlDTmDKxA3xkHGnDTgiUFCRyh3c
 6S6bQ3BmsQPUiF08hCoavnSSzMRKUZXuqYRVj3hUUIoNsUJm24pWjggKE/aN/cUCsBm1
 oFutKFLq4JZOVVVSfCs1j11U6v8WHQsK2hFEDDeK89hfb5XPqbKvnLtJGzFI2UrHt20+
 pbx8Snb1E9ukuNzT1gYUApNNkBeL/VtBZoOlf+cw4tDGqmEH/hQnhaCbtx+5GIzxdOLA +w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k4rxc8shf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 02:28:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29B2SSuL029191
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 02:28:28 GMT
Received: from [10.253.78.175] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 10 Oct
 2022 19:28:26 -0700
Message-ID: <776991f3-384e-f487-83b7-e1fbfd40cc4f@quicinc.com>
Date: Tue, 11 Oct 2022 10:28:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 00/27] another set of MLO patches
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
To: "Otcheretianski, Andrei" <andrei.otcheretianski@intel.com>,
        Johannes Berg
	<johannes@sipsolutions.net>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>,
        "Peer, Ilan" <ilan.peer@intel.com>
CC: <ath11k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <6175bc95-201c-cfab-2ae6-9ba77e830394@quicinc.com>
 <09556b33ad998ad243cf75dbc230f3b07349a87e.camel@sipsolutions.net>
 <935ef9e9-2092-e3f0-0edd-4aa29f4fa775@quicinc.com>
 <e01e75013f71ede7b29f2751238935e7147796f2.camel@sipsolutions.net>
 <f3afceb8-8120-12c7-74b9-caa3abce5cb8@quicinc.com>
 <DM6PR11MB3897D1A4E13419D9F938F559F5449@DM6PR11MB3897.namprd11.prod.outlook.com>
 <96bcc467-c530-46de-8f91-c5eb0af7a368@quicinc.com>
In-Reply-To: <96bcc467-c530-46de-8f91-c5eb0af7a368@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Of5OnLqflmA4SHIT5JG4YFFfSqr7f85t
X-Proofpoint-GUID: Of5OnLqflmA4SHIT5JG4YFFfSqr7f85t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-11_01,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1011
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210110011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_192834_328532_1B8D3AA6 
X-CRM114-Status: GOOD (  12.95  )
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

SGkgSWxhbi9BbmRyZWksCgpXaWxsIHlvdSBzZW5kIHlvdXIgcGF0Y2hlcyBvZiB3cGFfc3VwcGxp
Y2FudCB0byB1cHN0cmVhbT/wn5iBCgpPbiA5LzI4LzIwMjIgMTE6MTIgUE0sIFdlbiBHb25nIHdy
b3RlOgo+IE9uIDkvMTIvMjAyMiA5OjE3IFBNLCBPdGNoZXJldGlhbnNraSwgQW5kcmVpIHdyb3Rl
Ogo+Pj4+IFdlbGwsIE9LLCB5b3Ugb2J2aW91c2x5IGFyZSBhZGp1c3RpbmcgdGhlIHN1cHBsaWNh
bnQgdG8gd29yayB3aXRoIE1MTwo+Pj4+IChvdGhlcndpc2UgeW91IHdvdWxkbid0IGdldCBhbiBN
TE8gY29ubmVjdGlvbiBpbiB0aGUgZmlyc3QgcGxhY2UpLCBzbwo+Pj4+IHllYWgsIHRoaXMgaXMg
cGFydCBvZiB0aGUgYWRqdXN0bWVudHMgbmVlZGVkLgo+Pj4+Cj4+Pj4gSWxhbi9BbmRyZWkgaGF2
ZSBhbGwgb2YgdGhpcyB3b3JraW5nLCBtYXliZSB3ZSBjYW4gc2hhcmUgdGhlIHBhdGNoZXMKPj4+
PiBldmVuIGJlZm9yZSByZWJhc2UgZXRjLgo+PiBIaSwKPj4gT3VyIGltcGxlbWVudGF0aW9uIGlz
IGJhc2VkIG9uIG91ciBpbnRlcm5hbCB0cmVlLCBzbyBpdCB3aWxsIHRha2UgCj4+IHNvbWUgdGlt
ZSB0byBjbGVhbnVwIGFuZCBwb3J0IGl0IGZvciB1cHN0cmVhbS4KPj4gSG9wZWZ1bGx5IEkgd2ls
bCBoYXZlIHNvbWUgdGltZSB0byB3b3JrIG9uIGl0IHRoaXMgYW5kIG5leHQgd2VlayBhbmQgCj4+
IG1heWJlIHdlIHdpbGwgYmUgYWJsZSB0byBzaGFyZSBzb21ldGhpbmcgaW5pdGlhbC4KPiBNYXkg
SSBnZXQgeW91ciBwYXRjaGVzPwo+Pgo+PiBBbmRyZWkKPj4+PiBqb2hhbm5lcwo+Pj4gVGhhbmtz
Lgo+Pj4KPj4+IEl0IGlzIGdvb2QgdG8gc2hhcmUgbWUgdGhlIHdwYV9zdXBwbGljYW50IHBhdGNo
ZXMgQVNBUC4KPj4+Cj4+PiBBbmQgSSBoYXZlIGFub3RoZXIgcXVlc3Rpb246Cj4+Pgo+Pj4gV2hl
biBtYWM4MDIxMSB1c2UgdGhlIE1MRCBhZGRyIGluIGF1dGhlbnRpY2F0aW9uL2Fzc29jIHJlcXVl
c3QsCj4+Pgo+Pj4gZmluYWxseSwgaXQgc2hvdWxkIGJlIHJlcGxhY2VkIHdpdGggb25lIGxpbmsn
cyBhZGRyZXNzIGluIGFpciBwb3J0LCAKPj4+IHJpZ2h0Pwo+Pj4KPj4+IEl0IG1lYW5zIHRoZSBN
TEQgYWRkciB3aWxsIG5ldmVyIGV4aXN0IGluIG1hYzgwMjExIGhlYWRlciBvZiBwYWNrZXQgCj4+
PiBpbiB0aGUKPj4+IGFpciBwb3J0LCByaWdodD8KCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0
aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTFrCg==
