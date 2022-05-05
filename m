Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6DBC433EF
	for <ath11k@archiver.kernel.org>; Thu,  5 May 2022 10:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aO2u0JZ2NBOKLO432+3QkGHqVHHvXOzxb/sA7RVxsyc=; b=XnXYud5J4iNL/I
	M4gp5EH50HjgTSE852U37OJLTlI4wsSRQ8/AEfHCdQySzAUOXSduTLiulP5lvskyYQ/4UdTXP+U9d
	/3i9V34QtKRcl4uAYc5UpVmAQLGu6o5U8zPQ/yruF1rK4eUo+EMF02Ou7xp7ungoXrwBSfgcQgXXh
	EgAF5L52nHPveweAqzagzMZSeyjnWo4wag5h0nfIPmHM2sjKhpciiAmVxlCNfQ7Pk21bHgiKYFgwV
	lwhVtyV8Ox7eajxH82np6F1hjl6jCSrV97xjNeJsGKGgNJdv6rNRP/SPnrRK8NbDbdqgqj5iYOAmg
	QQvZCATtOJ4hxo3iSRDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmYgA-00FEQ9-LN; Thu, 05 May 2022 10:25:50 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmYg7-00FEPI-AM
 for ath11k@lists.infradead.org; Thu, 05 May 2022 10:25:49 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2458kk32026132;
 Thu, 5 May 2022 10:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Uu1rFd2JM66O7PEBdhZgdfo5hJTUhxwojr0ykag/nhs=;
 b=vcMkbNb8kSR4y1/OYMTcCFrJw0/nX3l8lmD63TsGRM6mB7g5Ong3eroN1wuSBT6wf7Vh
 z1dNJO435/mGnaBphNb4ktc+1FEADWGlD6iCw8YlcW/p/PAK+M3BOGxqcuPqEo/A468O
 fKBILtCa7DfiLDumhnEuuu6WCNOuKdiLQBa7J6ePYf5TaOuVGZnZcGVHbJ7qHY7UQSdG
 13H6nneQRiZ0UcZ1MwYl6ezxTW+jKlwif5T72pmK71Ki9Liyx8EGzbH/zv2fxd1e8Fiu
 MbIZaYECFcZRd8HeD9g339HgrYBhLR2tvx0ZfDt4KL1xGBhdIu4wQI6CaDEBwOFrNCb6 HA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruhcaqe7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 10:25:46 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245AKXUa009434; Thu, 5 May 2022 10:25:45 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fruj4d6jf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 10:25:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqkDYTGIf6YrrHP+oAftKVpgCpe5pVzm6AcV2YHt3158WNMypkKpGdkpa4VKKwjSgV+w7FNLymzxMV2LZ1CoWYa/uwPIAbSuSuYdnUwyEUoCiiD9b6Qjd563omuthQeWa6V9NmozUpbVTTLzAlNbRpbNnUI772M2CUV7SGjb4uI3BEsW3ns2QJWMekdpIMj46u4edqg/0IJFCmNsOhV8DOTtKGq6pjqu8aKi/rIKR+ofU/jHLapRz1huVshe5n9rTA9wRxMsXnSkPh87GGlQOv2LjNAcpqZyoOJgEDjhg6v1zxsujESDmq+3zcOJIn3e8tvVWORIi1755mMn1fqtqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uu1rFd2JM66O7PEBdhZgdfo5hJTUhxwojr0ykag/nhs=;
 b=ah+Qikq1+jQ05KsNXIu+qJyOer7fxy2ztg0eHOA5Ac7vZXJoe94MbXZp52NiE5MoNzODEmxGl9GgVDOcbWORt32O9+XoPoqc4jGLg7by83yiaRsaKLnA+TieZNzn+hN0mcECqVwdM4erLzPlk9mdVbOQVMs9GL7lz9KPqUIzSg/WeNdUqLOAy2HyTJEopNultApNwKkdkBUf9CVv0+PwOXmnsCkHA4aGCjN6l8PmJKDpY+XEu7lVmS5V7DpVIqpYW+ubDti2OB0zEdq+g2QaiQH05cDRLVCE8bf76ap/8yvYMD3QKirRJFHG6s0tmKX6vjKPLvJZWYXNmhffvtk8OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uu1rFd2JM66O7PEBdhZgdfo5hJTUhxwojr0ykag/nhs=;
 b=hjF0O4gj5wKJkRkmjncf+H4gHUtV27qcn8OQMd7N5AYVGPDXzQLhTA1U1yu6ooQB/1JrMnCa8M3etIqk7xXIwsszYn+zQQ48qCLft0wbaRW3z5jHYAxvsV9/KEjKHDB4TbgWfna7kptqKK/22Z6I7D9ICKUn9bmMigP6Ah+JR8M=
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by PH0PR10MB4710.namprd10.prod.outlook.com
 (2603:10b6:510:3e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 10:25:43 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e929:b74c:f47c:4b6e]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e929:b74c:f47c:4b6e%4]) with mapi id 15.20.5206.024; Thu, 5 May 2022
 10:25:43 +0000
Date: Thu, 5 May 2022 13:25:34 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: quic_wgong@quicinc.com
Cc: ath11k@lists.infradead.org
Subject: [bug report] ath11k: report rssi of each chain to mac80211 for
 QCA6390/WCN6855
Message-ID: <YnOmHi3JhnFUc3YQ@kili>
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0185.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::18) To CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3ead8c1-3195-47be-c1ed-08da2e819be7
X-MS-TrafficTypeDiagnostic: PH0PR10MB4710:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4710F2ACCD4A098517D86F288EC29@PH0PR10MB4710.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rG8fOtYux12hq37lZjkgIOONfsw0AHDyALirKtY7jM1ITFjanU5nYJVqgTgsM+shm/LJG+NXeOCz0L8z3S6O1F8J4d1XsvexFkBih/8IpxJAigPLaNo0emPkYubWBwSGkSI9mX2n4rxCmsKiZv3Q9fH7vnhjne7/7jHfkDWpj2wIl1IUaAmDKwq31DK87cSnO1zRmPbWtifyPxpw9dZl3PxazUTYbK5vryZ2VcVWNwdJ4lrK2b3vQLjMsrrcaukRzR3nurl//4zChZu3IFD8YQHUHQEARloyQIyO7HxHICpEUEVjN3WaszwzHcjTqvCpvxCOyEK+EkK2wIHIK6r8D1pDZVLmzMD+BSlNQsnCeJ/Q1kqxb5ITI++BfpzamqDEVGkafB0n0MVeLqa19P38hWg7u/1T2LhKbnMxNbxtQKWb3Tg5YOQzamuVtvqsRkAcEUZzO8c3AWlEVPYBs+o8NZ5Y7zUv8PKdUzlJrmxC/YWQhUpYBfTbxHqG0owaPKWQARXYawZPcQfRs4jTb3aBdklXVh1BmPyPAA5HcY5lWZYvDRxSWpwGMl/3612BXlgCWHXuGwj3Njs3gXhSiWFgXy7+o7x2Ijn4HgXkz2curh5hNmZU7x4USN13rKm7SPRxaFosMNydOD2UxeWg7vhABoX7bvbnIjKgnkcRWqfwZ8+E2amiaPr6UBlfkk1a1ggBorZE9RGzJp+DqNug4R6Z0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2358.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(6916009)(38350700002)(38100700002)(86362001)(26005)(9686003)(6512007)(66556008)(66946007)(8676002)(66476007)(4326008)(52116002)(83380400001)(6666004)(186003)(33716001)(316002)(44832011)(5660300002)(6506007)(508600001)(2906002)(8936002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7jR5Tg0UwNvQEEItef6GnPsDyE09LP4B7A5S0LquU2lU57rBZR1GwiRH3yuw?=
 =?us-ascii?Q?4MjlsELPvh73oL4fvR1rrMXmxOkWvW5JPiZL7RVAIlZJAkDL/501OCUF5leV?=
 =?us-ascii?Q?ZNlaswVn2V8BkIBk/6wkaExm0n4YO2RKm4tcNmZGdHxoZLJZQ81YJtQ1JVQu?=
 =?us-ascii?Q?SqD+TuN2mxrVJP/Kw4vMrd4lZaigarEkUeH01GMNayTzr6CwvPDTjkRLzRJN?=
 =?us-ascii?Q?grtgy1mNLieTlLzKXnENvqij9VYSfHK/pFRgmh+xwq2plD2CqaJFdPxciCpZ?=
 =?us-ascii?Q?qbplX/OPa+sw0hJdoRr7IKKPQfrGgE+cmqxgkWtYCRWT6EzVw+3xWeb+ZX7A?=
 =?us-ascii?Q?nDqounQY2dw1tF8KsKXZ28YhMpxyzvOaLZrX5yYI9T+QE8r0cCdRqJq6SQmj?=
 =?us-ascii?Q?Cn7owv2+42Wvgvs/9l1HKpHIK2GW4gwk1Dt6wHDo0W1VFIj5NvXntsAaeQll?=
 =?us-ascii?Q?gHZI/ro+3tPUfOmZ706YJLgHW/v5xArWxdpuzzgdXIdzcWtX05qT2ARHGDyR?=
 =?us-ascii?Q?rT3UE2mkPFTV1J9LDW7tvmzqAGBoxzwUINRzs2GPYOu9EjG7uWa7/0To7zdv?=
 =?us-ascii?Q?cmx6AkqYllTbIuhpP6AwdFJRYzzibAi92UgikfilGDZl7LL7RoOzSkC1B3lD?=
 =?us-ascii?Q?yHDc27ehnPSHIE0QvgAoc6p/x6f4EeSJFh2nQPuxzg153WWktMEAToDIuovB?=
 =?us-ascii?Q?wiL9A6tcH6VZRd+URXH/xRkyKGzs8ZjsC9tTFSByBjmwo2zTGxtPFSkrj/Cv?=
 =?us-ascii?Q?zozwcPuWb0c+fqlnYc1L699Hf3O3OTgp8xdDMF0bQu2JUO72ixAEEuVnfzuV?=
 =?us-ascii?Q?6l94CacTJKp5ByvRP4wTBn3RKdLGJ9cYv4hitmNMXPTyKCN+Aficm4cvGnwX?=
 =?us-ascii?Q?7XBl4MRXUHiy1x1pjmpx0UauCDtexyVin1J/BCfyERmIqpxa1jjyBoCE8Mu/?=
 =?us-ascii?Q?oTU3hQJMtamXwy5LzzAYq8DIsuHzBDIHI2bB/4kbhxfOB5q6fGIDCpO2n7Eg?=
 =?us-ascii?Q?21CqJLgIjjau8g/kLlBrkaS3w0S/sZtfd2QKJOY7+ALQTBLA4Zk1V/jdeGoH?=
 =?us-ascii?Q?opg1sAxDxwRTP9CQExVMTEv0GDkA7v1pQZnL5aK2TvkfG0d3b8BhEXGNmhfl?=
 =?us-ascii?Q?NPVrfR9VRd9IFgGtDaRqU/BdfmP4kGfEC4i4w+JY+d3YXoP3bDigT2YhdVGb?=
 =?us-ascii?Q?vqEN5yIi1XNRikXDQJIPGBHCTCNpD2gZ/6uwnIM+0HHKx0k/RuO22hJqxEO+?=
 =?us-ascii?Q?jn7QMZv+b87S5cpawjaiwly07e3A+PVkkAr1c3R8zr3XinNTTWGvhyrFKlTf?=
 =?us-ascii?Q?zPH6sU13B+oCvPWEU/JZpJLB74PJKXzttJL0ozhFewXQwt7CSqvIQrr0TZbD?=
 =?us-ascii?Q?4rT9C6w8hckbGylva8QLWlNTzTkayd+DV9WNQL9DVkR9RA9+ZaeLGghFbGTX?=
 =?us-ascii?Q?4dbDgKXPE07ezRPHAiWYwW2u0ErnQBb51Ttvus0t8kCDfLGlbdqpaKDNMZwr?=
 =?us-ascii?Q?8+WADq+uo3fdc9omD1zMEF8GQfztQcSKzx1bUm0Xw3HrsbdcKN1IDcDLB9ei?=
 =?us-ascii?Q?zrq6CkQbtKBhOgPBCwJPvginNPFWZpkx3ZCzplUkgT9aUV283/jQumuiFPXL?=
 =?us-ascii?Q?Lu/RHjf+wNmQ+q43B9rVFS4Zyrpksa0kzKdIwxJeu4e6a82wQWDPF525GAiY?=
 =?us-ascii?Q?IUXXirZUgZfRx253ITNwcM7wC2seA3GPi8ovzLxIPgNytir05KiQzjnNjOex?=
 =?us-ascii?Q?r20CFhhZOW7YGzE7tENto4W62L4hvug=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ead8c1-3195-47be-c1ed-08da2e819be7
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 10:25:43.0318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOynuEzXtMBgIA6G+65p/4CXGtd5adGh2WXzpjSwrzzlgMUEUFCLP1tB/AwVPcAgv8b30mhsb8dWL1y92CHFILjdb4CjDg6GHk7VL2FfPSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4710
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_04:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 mlxlogscore=688 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050073
X-Proofpoint-GUID: Qu1V00CQtvKTtcuf_wbXgPSLtvyAXn3S
X-Proofpoint-ORIG-GUID: Qu1V00CQtvKTtcuf_wbXgPSLtvyAXn3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_032547_528751_901A63AB 
X-CRM114-Status: GOOD (  11.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hello Wen Gong,

The patch b488c766442f: "ath11k: report rssi of each chain to
mac80211 for QCA6390/WCN6855" from Dec 17, 2021, leads to the
following Smatch static checker warning:

	drivers/net/wireless/ath/ath11k/wmi.c:5800 ath11k_wmi_tlv_rssi_chain_parse()
	warn: missing error code here? 'ieee80211_find_sta_by_ifaddr()' failed. 'ret' = '0'

drivers/net/wireless/ath/ath11k/wmi.c
    5755 static int ath11k_wmi_tlv_rssi_chain_parse(struct ath11k_base *ab,
    5756                                            u16 tag, u16 len,
    5757                                            const void *ptr, void *data)
    5758 {
    5759         struct wmi_tlv_fw_stats_parse *parse = data;
    5760         const struct wmi_stats_event *ev = parse->ev;
    5761         struct ath11k_fw_stats *stats = parse->stats;
    5762         struct ath11k *ar;
    5763         struct ath11k_vif *arvif;
    5764         struct ieee80211_sta *sta;
    5765         struct ath11k_sta *arsta;
    5766         const struct wmi_rssi_stats *stats_rssi = (const struct wmi_rssi_stats *)ptr;
    5767         int j, ret = 0;
    5768 
    5769         if (tag != WMI_TAG_RSSI_STATS)
    5770                 return -EPROTO;
    5771 
    5772         rcu_read_lock();
    5773 
    5774         ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
    5775         stats->stats_id = WMI_REQUEST_RSSI_PER_CHAIN_STAT;
    5776 
    5777         ath11k_dbg(ab, ATH11K_DBG_WMI,
    5778                    "wmi stats vdev id %d mac %pM\n",
    5779                    stats_rssi->vdev_id, stats_rssi->peer_macaddr.addr);
    5780 
    5781         arvif = ath11k_mac_get_arvif(ar, stats_rssi->vdev_id);
    5782         if (!arvif) {
    5783                 ath11k_warn(ab, "not found vif for vdev id %d\n",
    5784                             stats_rssi->vdev_id);
    5785                 ret = -EPROTO;
    5786                 goto exit;
    5787         }
    5788 
    5789         ath11k_dbg(ab, ATH11K_DBG_WMI,
    5790                    "wmi stats bssid %pM vif %pK\n",
    5791                    arvif->bssid, arvif->vif);
    5792 
    5793         sta = ieee80211_find_sta_by_ifaddr(ar->hw,
    5794                                            arvif->bssid,
    5795                                            NULL);
    5796         if (!sta) {
    5797                 ath11k_dbg(ab, ATH11K_DBG_WMI,
    5798                            "not found station of bssid %pM for rssi chain\n",
    5799                            arvif->bssid);
--> 5800                 goto exit;

Should this return an error code or zero?  It's hard for me to tell.
If returning a zero is correct then doing the "ret = 0;" assignment
within 4 (or 5?) lines of the "goto exit;" will silence the warning.

    5801         }
    5802 
    5803         arsta = (struct ath11k_sta *)sta->drv_priv;
    5804 
    5805         BUILD_BUG_ON(ARRAY_SIZE(arsta->chain_signal) >
    5806                      ARRAY_SIZE(stats_rssi->rssi_avg_beacon));
    5807 
    5808         for (j = 0; j < ARRAY_SIZE(arsta->chain_signal); j++) {
    5809                 arsta->chain_signal[j] = stats_rssi->rssi_avg_beacon[j];
    5810                 ath11k_dbg(ab, ATH11K_DBG_WMI,
    5811                            "wmi stats beacon rssi[%d] %d data rssi[%d] %d\n",
    5812                            j,
    5813                            stats_rssi->rssi_avg_beacon[j],
    5814                            j,
    5815                            stats_rssi->rssi_avg_data[j]);
    5816         }
    5817 
    5818 exit:
    5819         rcu_read_unlock();
    5820         return ret;
    5821 }

regards,
dan carpenter

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
