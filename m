Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2B8C433FE
	for <ath11k@archiver.kernel.org>; Tue, 11 Oct 2022 04:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vz2ECGLGrHfRL8juAwDo+ct6xZ+yqLgUBNDUN8cB0o=; b=dYk9UlSC4WG+bJ
	pnOzXkiL9R/GzFjCoZxtkk/OosWS3Oz66h89obIaJWk+aMQKjew2jio5tPhG1BWk8m+WBOfvCvZKJ
	0ZDqJTpMZU4zEaznkxP7LnrcKg1/Tbd9myPEZd6M/cCe8rVguhV2CAL7U9C1fRi2dl9WzzfOw7eyq
	pf2sQKKTtKo4Yvxc9phiniBZNWzCZ61J/jO0FronYgedcMRsFsfj8TJ+dUSw/Rial+ZedO9C6l9QM
	cdKEwFPVyoaPqJnSBJ0diibGMlSRN8Ps682NE1xHcmb1jO/E9PpYIKvVTQL+ywa09rgQqJmEl6amx
	8wpjN52lOrZCdHo0FTdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi6Y8-003DZO-1a; Tue, 11 Oct 2022 04:07:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi6Xo-003DOB-Rd
	for ath11k@lists.infradead.org; Tue, 11 Oct 2022 04:07:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B2hbjr010041;
	Tue, 11 Oct 2022 04:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=CyOg+0MeMnZwIy5vzY+2hxSI6SeP1oI+tUHkpV0tcTI=;
 b=iROl0KQtQJYBNJRtf9wtvn3dgVhPOs4mJ7W60+tJHXflVJSdpeZveMt7ef1vMCakkXYc
 3r0T1zg4YbneCl9EX4WVIBG2xJ3fG9l2GTrcCcGlG//G3qqz8hMG/7lDkdJLV9iPWG2C
 JCeedzEaaIcuAm3M1YaqyTrr1Dtdqz1LiEAUvUB3990uNxApp8s+nvBl/WpWM1/u7v6x
 qCMaO67um5RaOvmUp0Mef2ufOBvPkgijVhHbuKUn2eSzdjgH2e5JJUS3Usji1eGQl4lE
 //feewn5v8Y+yehshXsUHyLJ2k4uerJ232TmLyGItD/x98ZpnrH7m6mBHgRKe64CEYcx 2A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k4rx194xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 04:07:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29B4734A026879
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 04:07:03 GMT
Received: from [10.253.78.175] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 10 Oct
 2022 21:07:02 -0700
Message-ID: <5765e3c5-46d4-e92b-a93b-4a2649acff2a@quicinc.com>
Date: Tue, 11 Oct 2022 12:07:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
 <2de44394-cb93-7be4-481f-2d92788b8d28@quicinc.com>
 <351f74e0e1cd6e9724f97dbd042bdc5e04c44842.camel@sipsolutions.net>
 <c05780bc-864c-9323-499d-a8b1ba1c2ef2@quicinc.com>
 <545227cf18baac94ea8aa24dc08b250c47949541.camel@sipsolutions.net>
 <c7fd18fa-531f-a90d-a8fb-442a5aa66d7d@quicinc.com>
 <d1fda46a-2481-8e05-e0a5-9f2bd3850ff4@quicinc.com>
 <868131d13ed7c4c8b5d4938adcd71cf1ff8e9677.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <868131d13ed7c4c8b5d4938adcd71cf1ff8e9677.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: G6mJZpgelCpIV4uZiAl2jz5sP8PaSONt
X-Proofpoint-GUID: G6mJZpgelCpIV4uZiAl2jz5sP8PaSONt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-11_02,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxlogscore=824 clxscore=1015 impostorscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210110022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_210704_935627_9B99CD18 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

T24gOS8yOC8yMDIyIDExOjI4IFBNLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgouLi4KPgo+PiBNYXkg
SSBrbm93IHNvbWUgbW9yZSBpbmZvL3N0YXR1cyBhYm91dCB0aGUgImluY29taW5nwqAgbmV3IG1l
dGhvZCB0byBsZXQKPj4gZHJpdmVycyBzZXQgdGhlIGxpbmsgYWRkcmVzcyI/Cj4+Cj4gSSB3YXNu
J3QgYWN0dWFsbHkgcGxhbm5pbmcgdG8gd29yayBvbiB0aGF0IG15c2VsZiwgRldJVy4KPgo+IGpv
aGFubmVzCgpPSy4gU28gaGFzIHNvbWUgYm9keSB3aWxsIHdvcmsgZm9yIHRoYXQgbm93P/CfmIEK
CgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
